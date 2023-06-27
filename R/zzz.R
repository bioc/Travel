#' @useDynLib Travel, .registration = TRUE
#' @importFrom Rcpp sourceCpp
NULL

pkg_data <- new.env()
pkg_data$pkg_unloaded <- FALSE

#file.remove()
onExit <-function(e){
    if(!pkg_data$pkg_unloaded)
        stop_filesystem()
}

.onLoad<- function(libname, pkgname){
    if(Sys.getenv("DEBUG_TRAVEL_PACKAGE")!="T"){
        set_verbose(FALSE)
    }else{
        set_verbose(FALSE)
        C_set_debug_print(TRUE)
        C_set_altrep_print(FALSE)
        C_set_filesystem_print(TRUE)
        set_filesystem_log(TRUE)
    }
    reg.finalizer(pkg_data, onExit, onexit = TRUE)
}

.onUnload<- function(libpath){
    C_close_filesystem_log()
    stop_filesystem()
    pkg_data$pkg_unloaded <- TRUE
    library.dynam.unload("Travel", libpath)
}
.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.19")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}




