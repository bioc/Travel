#' Create a new ALTREP object from an R ALTREP
#' 
#' Create a new ALTREP object from an R ALTREP, the new ALTREP object
#' owns a data pointer. However, it is a dummy pointer in the sense
#' that the data is not in the memory. The pointer can be operated as
#' a normal pointer but the request of accessing the data will be send to the 
#' wrapped ALTREP object.
#' 
#' @param x an ALTREP object
#' @return A new ALTREP object
#' @examples
#' x <- 1:10
#' y <- wrap_altrep(x)
#' @export
wrap_altrep<-function(x){
    C_make_altmmap_from_altrep(x)
}

#' Automatically deploy the filysystem
#' 
#' This function will be called once when the package is loaded.
#' It will mount a filesystem to a temporary directory. The Travel
#' package relies on the filesystem to work. It is a no-op if the 
#' filesystem has been mounted.
#' @examples 
#' deploy_filesystem()
#' @export
deploy_filesystem <- function(){
    message("Deploying filesystem")
    if(is_filesystem_running()){
        return("The filesystem has been running")
    }
    mountpoint <- get_temp_mountpoint()
    set_mountpoint(mountpoint)
    run_filesystem()
}