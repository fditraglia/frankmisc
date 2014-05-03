#' @title Calculate root mean squared error
#' @description This function calculates root mean squared error centered around a user-specified true value, which defaults to zero.
#' @param x A vector of observations.
#' @param truth The true parameter value. Defaults to zero.
#' @return The root mean squared error of \code{x} centered around \code{truth}.
#' @examples
#' set.seed(1)
#' y <- rnorm(10)
#' rmse(y)
#' rmse(y, trim 0.05)
#' y <- c(y, NA)
#' rmse(y, na.rm = TRUE)

rmse <- function(x, truth = 0, ...){
 sqrt(mean((x - truth)^2,...))
}



#' @title Calculate mean squared error
#' @description This function calculates mean squared error centered around a user-specified true value, which defaults to zero.
#' @param x A vector of observations.
#' @param truth The true parameter value. Defaults to zero.
#' @return The mean squared error of \code{x} centered around \code{truth}.
#' @examples
#' y <- rnorm(10)
#' mse(y)
#' mse(y, trim 0.05)
#' y <- c(y, NA)
#' mse(y, na.rm = TRUE)

mse <- function(x, truth = 0,...){
  mean((x - truth)^2,...)
}




#' @title Center and standardize a vector
#' @description This function converts a vector of observations to z-scores, by subtracting the sample mean and dividing by the sample standard deviation.
#' @param x A vector of observations
#' @param na.rm Remove missing values? Defaults to TRUE.
#' @return The z-scores corresponding to \code{x}.
#' @examples
#' y <- rnorm(10, 5, 10)
#' zscores(y)

zscores <- function(x, na.rm = FALSE){
  (x - mean(x, na.rm = na.rm)) / sd(x, na.rm = na.rm)
}



#' @title Average grade with lowest scores dropped
#' @description This function calculates the mean of a vector of student grades after dropping a user-specified number of the lowest scores.
#' @param x A vector of grades.
#' @param drop Number of lowest grades to drop.
#' @return The average of \code{x} after setting missing values to zero and dropping the lowest \code{drop} observations.
#' @examples
#' grades <- c(85, 90, NA, 100, 75)
#' drop.avg(grades, 2)

drop.avg <- function(x, drop){ 
  missing <- is.na(x)
  x[missing] <- 0
  x <- sort(x)
  x <- x[-(1:drop)]
  return(mean(x))
}

