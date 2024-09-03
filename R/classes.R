
setClass("fileSet", contains="list")              # 1:1 with sesame

setClass("FileSet", 
         representation(map_path="character",     
                        platform="character",     # annotation
                        probes="character",       # rownames
                        samples="character",      # colnames
                        inc="numeric",            # should be integer?
                        n="integer",              # nrow
                        m="integer"))             # ncol



