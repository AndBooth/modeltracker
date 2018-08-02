
context("Testing folder creation functions")

test_that("create folders", {

  create_folder("./test_folder")

  expect_true(dir.exists("./test_folder"))
  expect_message(check_tracking_folder(),
                 "tracking folder was created in the project working directory")

})


test_that("add experiment", {

  expect_error(add_experiment())
  add_new_experiment("new_experiment")
  expect_true(dir.exists("./tracking/new_experiment"))

})
