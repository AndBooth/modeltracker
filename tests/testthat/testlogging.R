
context("Testing logging functions")

test_that("test logging metric function", {

  x <- 1

  expect_error(log_metric("this", x, "x"))

  add_new_experiment("test_logging_metric")
  log_metric("test_logging_metric", x, "x")
  log_metric("test_logging_metric", x, "x")

  input <- read.table("tracking/test_logging_metric/metrics/x")

  expect_equal(nrow(input), 2)
  expect_true(file.exists("tracking/test_logging_metric/metrics/x"))
})


test_that("test logging param function", {

  x <- 1

  expect_error(log_param("this", x, "x"))

  add_new_experiment("test_logging_param")
  log_param("test_logging_param", x, "x")
  log_param("test_logging_param", x, "x")

  input <- read.table("tracking/test_logging_param/params/x")

  expect_equal(nrow(input), 2)
  expect_true(file.exists("tracking/test_logging_param/params/x"))
})


