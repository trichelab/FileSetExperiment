# Make generic SummarizedExperiment-derived objects behave as if minfi objects:


# generic replace method 
.set <- function(object, value, ..., x, what=c("slot", "assay", "meta")) { 
  what <- match.arg(what)
  if (what == "slot") slot(object, x) <- value
  if (what == "assay") assay(object, x) <- value
  if (what == "meta") metadata(object)[[x]] <- value
  return(object) 
}


# what we are getting and setting
SE <- "SummarizedExperiment"
asys <- c("Red", "Green", "Beta", "CN")
slots <- c("annotation", "preprocessMethod")


# getters
for (x in c(asys, slots)) {
  m <- ifelse(x %in% asys, paste0("get", x), x)
  if (x %in% asys) {
    setGeneric(m, function(object) assay(object, x))
    setMethod(m, SE, function(object) assay(object, x))
  } 
  if (x %in% slots) {
    setGeneric(m, function(object, ...) slot(object, x))
    setMethod(m, SE, function(object, ...) metadata(object)[[x]])
  }
}


# setters
for (x in slots) {
  m <- paste0(x, "<-")
  setGeneric(m, function(object, value) .set(object, value, x, "slot"))
  setReplaceMethod(x, SE, 
                   function(object, value) .set(object, value, x, "meta"))
}


# helper fn
B2M <- function(p) log2(p / (1 - p))
setGeneric("getM", function(object) assay(object, "M"))
setMethod("getM", SE, function(object) B2M(getBeta(object)))


# relatively simple hacks
setGeneric("getMeth", function(object) assay(object, "Meth"))
setMethod("getMeth", SE, function(object) getBeta(object)*(2 ** getCN(object)))
setGeneric("getUnmeth", function(object) assay(object, "Unmeth"))
setMethod("getUnmeth",SE,function(object)(1-getBeta(object))*(2**getCN(object)))


# add a `seqinfo` method for SummarizedExperiment objects that are NOT Ranged
setMethod("seqinfo", "SummarizedExperiment", 
          function(x) Seqinfo(genome=metadata(x)[["genome"]]))
# the above is a bit of a kludge but allows one to use the locus and/or block
# coordinates for an array corresponding to the appropriate assembly on-the-fly


# FileSet generics for sesame fileSets 
setMethod("nrow", "FileSet", function(x) x@n)

setMethod("ncol", "FileSet", function(x) x@m)

setMethod("rownames", "FileSet", function(x) x@probes)

setMethod("colnames", "FileSet", function(x) x@samples)

setMethod("annotation", "FileSet", 
          function(object, ...) {
            ary <- ifelse(object@platform == "MM285", 
                          object@platform, 
                          sub("HM", "IlluminaHumanMethylation", 
                              sub("EPIC", "IlluminaHumanMethylationEPIC", 
                                  object@platform)))
            c(array=ary)
          })

setMethod("dim", "FileSet", function(x) c(nrow(x), ncol(x)))

setMethod("path", "FileSet", function(object, ...) slot(object, "map_path"))

setMethod("$", "FileSet", function(x, name) slot(x, name))

setMethod("show", "FileSet", 
          function(object) {
            cat("class: ", class(object), "\n")
            cat(nrow(object), "x", ncol(object), "FileSet\n")
            cat("  Platform: ", annotation(object)["array"], "\n", sep="")
            cat("  Path: ", path(object), "\n", sep="")
          })


# automatic coercion
setAs("fileSet", "FileSet", 
      function(from) {
        new("FileSet", 
            map_path=from$map_path,
            platform=from$platform,
            probes=from$probes,
            samples=from$samples,
            inc=from$inc,
            n=from$n,
            m=from$m)
      })


# automatic coercion
setAs("FileSet", "fileSet",
      function(from) {
        sn <- slotNames(from)
        names(sn) <- sn
        res <- lapply(sn, slot, object=from)
        class(res) <- "fileSet"
        return(res)
      })


# selections
setMethod("[", 
          c(x="FileSet", i="ANY", j="ANY", drop = "ANY"),
          function (x, i, j, drop = FALSE) {
            m <- c()
            if (missing(i)) i <- rownames(x)
            if (is.numeric(i)) i <- rownames(x)[i]
            if (!all(i %in% rownames(x))) m <- c(m, "Invalid row indices")
            if (missing(j)) j <- colnames(x)
            if (is.numeric(j)) j <- colnames(x)[j]
            if (!all(j %in% colnames(x))) m <- c(m, "Invalid column indices")
            if (length(m) > 0) stop(paste(m, collapse="; "))
            else sliceFileSet(x, samples=j, probes=i)
          })
