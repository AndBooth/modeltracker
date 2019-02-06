

#' Log an artifact
#' @description Save an \code{R} object created during an
#' experiment run
#' @param x the object to save
#' @param experiment the name of the current experiment
#' @param i run number
#' @note currently supported objects that can be written are
#' \itemize{
#'   \item \code{ggplot2}
#'   \item \code{data.frame}
#'   \item \code{matrix}
#'   \item \code{list}
#'   \item \code{vector}
#' }
#' @export
log_artifact <- function(x, experiment, i) {

  location <- paste0("./tracking/", experiment)

  if(!check_experiment(location)) stop("Experiment `", experiment, "` does not exist", call. = FALSE)

  UseMethod("log_artifact")
}

#' @export
log_artifact.default <- function(x, experiment, i) {
  stop(
    "Don't know how to deal with class <",
    class(x)[[1]], ">",
    call. = FALSE
  )
}

#' @export
log_artifact.gg <- function(x, experiment, i) {

  label <- paste0(deparse(substitute(x)), "_", i, ".png")
  location <- paste0("./tracking/", experiment, "/artifacts/")

  ggplot2::ggsave(filename = label, plot = x, device = "png", path = location)
}

#' @export
log_artifact.data.frame <- function(x, experiment, i) {

  label <- deparse(substitute(x))
  location <- paste0("./tracking/", experiment, "/artifacts/", label, "_", i, ".txt")

  write.table(x, file = location, row.names = FALSE, col.names = TRUE)

}

#' @export
log_artifact.matrix <- function(x, experiment, i) {

  label <- deparse(substitute(x))
  location <- paste0("./tracking/", experiment, "/artifacts/", label, "_", i, ".txt")

  MASS::write.matrix(x, file = location, col.names = writenames)

}

#' @export
log_artifact.list <- function(x, experiment, i) {

  label <- deparse(substitute(x))
  location <- paste0("./tracking/", experiment, "/artifacts/", label, "_", i, ".rda")

  saveRDS(x, file = location)

}



