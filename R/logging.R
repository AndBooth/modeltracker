

#' Log the value of a model parameter
#' @description Writes the value of the provided parameter to a file
#' in the params sub-directory of the current experiment
#' @param experiment name of the current experiment
#' @param param the parameter to write out
#' @param as name to call the saved parameter
#' @note It is recommended not to change the value of \code{as} from one run
#' of the experiment to the next as it will not be possible to evaluate the
#' changing performance of the model with the changing value of \code{param}
#' @examples
#' \dontrun{
#' x <- 10
#' log_param("experiment", param = x, as = "x_value")
#' }
#' @export
log_param <- function(experiment, param, as) {

  location <- paste0("./tracking/", experiment)

  if(!dir.exists(location)) {
    stop("could not find experiment with name `", experiment, "`", call. = FALSE)
  }

  location <- paste0(location, "/params/", as)
  write(param, file = location, append = TRUE)

}


#' Log the value of a model evaluation metric
#' @description Writes the value of the provided metric to a file
#' in the metrics sub-directory of the current experiment
#' @param experiment name of the current experiment
#' @param metric the metric to write out
#' @param as name to call the saved metric
#' @note It is recommended not to change the value of \code{as} from one run
#' of the experiment to the next as it will not be possible to evaluate the
#' changing performance of the model with the changing value of \code{metric}
#' @examples
#' \dontrun{
#' log_param("experiment", metric = rmse, as = "rmse")
#' }
#' @export
log_metric <- function(experiment, metric, as) {

  location <- paste0("./tracking/", experiment)

  if(!dir.exists(location)) {
    stop("could not find experiment with name `", experiment, "`", call. = FALSE)
  }

  location <- paste0(location, "/metrics/", as)
  write(metric, file = location, append = TRUE)

}
