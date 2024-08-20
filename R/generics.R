# generic replace method 
.grm <- function(object, value, s) { slot(object, s) <- value; return(object) }


# Make generic SummarizedExperiment-derived objects behave as if minfi objects.
if (!isGeneric("getGreen")) 
  setGeneric("getGreen", function(object) assay(object, "Green"))
setMethod("getGreen", "SummarizedExperiment", 
          function(object) assay(object, "Green"))

if (!isGeneric("getRed")) 
  setGeneric("getRed", function(object) assay(object, "Red"))
setMethod("getRed", "SummarizedExperiment", 
          function(object) assay(object, "Red"))

if (!isGeneric("annotation")) {
  setGeneric("annotation", function(object, ...) slot(object, "annotation"))
}
setMethod("annotation", "SummarizedExperiment", 
          function(object, ...) metadata(object)$annotation)

if (!isGeneric("annotation<-")) {
  setGeneric("annotation<-", 
             function(object, value) .grm(object, value, "annotation"))
}
setReplaceMethod("annotation", 
                 c(object="SummarizedExperiment", value="ANY"),
                 function(object, ..., value) {
                   metadata(object)$annotation <- value
                   return(object)
                 })

if (!isGeneric("preprocessMethod")) {
  setGeneric("preprocessMethod", function(object) object@preprocessMethod)
}
setMethod("preprocessMethod", "SummarizedExperiment", 
          function(object) metadata(object)$preprocessMethod)

# helper fn
if (!isGeneric("preprocessMethod<-")) {
  setGeneric("preprocessMethod<-",
             function(object, ..., value) {
               object@preprocessMethod <- value
               return(object)
             })
}
setReplaceMethod("preprocessMethod", 
                 c(object="SummarizedExperiment", value="ANY"),
                 function(object, ..., value) {
                   metadata(object)$preprocessMethod <- value
                   return(object)
                 })

# helper fn
.M2B <- function(x) (2 ** x) / (1 + (2 ** x))

# helper fn
.B2M <- function(p) log2(p / (1 - p))

# using the above 
if (!isGeneric("getBeta")) setGeneric("getBeta")
setMethod("getBeta", "SummarizedExperiment", 
          function(object, ...) {
            if ("Beta" %in% assayNames(object)) assay(object, "Beta")
            else if ("M" %in% assayNames(object)) .M2B(assay(object, "M"))
            else stop("No Beta or M assay found")
          })

# also using the above
if (!isGeneric("getM")) setGeneric("getM")
setMethod("getM", "SummarizedExperiment", 
          function(object, ...) {
            if ("M" %in% assayNames(object)) assay(object, "M")
            else if ("Beta" %in% assayNames(object)) .B2M(assay(object, "Beta"))
            else stop("No Beta or M assay found")
          })

if (!isGeneric("getCN")) setGeneric("getCN")
setMethod("getCN", "SummarizedExperiment", 
          function(object, ...) assay(object, "CN"))

if (!isGeneric("getMeth")) setGeneric("getMeth")
setMethod("getMeth", "SummarizedExperiment", 
          function(object) getBeta(object) * (2 ** getCN(object)))

if (!isGeneric("getUnmeth")) setGeneric("getUnmeth")
setMethod("getUnmeth", "SummarizedExperiment", 
          function(object) (1 - getBeta(object)) * (2 ** getCN(object)))

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
