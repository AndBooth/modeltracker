
#' helper function to create a new folder in the
#' given location if it doesn't already exist
create_folder <- function(location) {

  if(!dir.exists(location)){
    dir.create(location)
  }

}


check_experiment <- function(location) {
  dir.exists(location)
}


#' creates a tracking folder in the root directory if doesn't
#' already exist
check_tracking_folder <- function() {

  location <- "./tracking"

  if(dir.exists(location)) {
    return()
  }

  if(!dir.exists(location)) {
    create_folder(location)
  }

  if(!dir.exists(location)) {
    stop("tracking folder could not be created", call. = FALSE)
  }

  message("tracking folder was created in the project working directory")
}


#' Create a new model tracking experiment
#' @description Creates a new model tracking experiment with the given
#' name, including sub-directories to store model parameters, metrics and
#' artifacts
#' @param name your experiment name - the experiment sub-directory within
#' the tracking folder will be given this name
#' @examples
#' \notrun{
#' add_new_experiment(name = "new_experiment")
#' }
#' @export
add_new_experiment <- function(name) {

  if(missing(name)) {
    stop("please provide a name for the experiment", call. = FALSE)
  }

  check_tracking_folder()

  location <- paste0("./tracking/", name)
  locparams <- paste0(location, "/params")
  locmetrics <- paste0(location, "/metrics")
  locartif <- paste0(location, "/artifacts")
  locfiles <- paste0(location, "/files")

  if(dir.exists(location)) {
    stop("experiment already exists, please choose a different name", call. = FALSE)
  }

  create_folder(location)
  create_folder(locparams)
  create_folder(locmetrics)
  create_folder(locartif)
  create_folder(locfiles)
}



