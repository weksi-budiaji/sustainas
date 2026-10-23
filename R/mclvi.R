#' Montecarlo normal method for livelihoos vulnerability index
#'
#' @description This function generate montecarlo simulation with normal method.
#'
#' @param n A number of data simulation (\emph{see} \strong{Details}).
#' @param datlvi An input of data set (\emph{see} \strong{Details}).
#' @param sub.id An column id for each component (\emph{see} \strong{Details}).
#' @param dim.name Components' name (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param sd A standard deviation for the normal distribution (\emph{see} \strong{Details}).
#'
#' @details \code{n} is a number of the data simulation.
#' The data set \code{dat} arguments is a data set as a source
#' data for the simulation.
#' For \code{maxim} and  \code{minim} arguments, they have default
#' values 10 and 0, respectively. A user can modify them.
#' \code{sd} set the dispersion tendency of the simulation.
#'
#' @return Function returns coordinates of Montecarlo simulation.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#'
#' @references Kavanagh, P., & Pitcher, T. J. 2004. Implementing Microsoft Excel software for Rapfish:
#' a technique for the rapid appraisal of fisheries status.
#' doi:http://dx.doi.org/10.14288/1.0074801
#'
#' @examples
#' #data simulation
#'
#' @export


mc_lvi <- function(n = 100, datlvi, sub.id = c(1,3,5,7,9),
                   dim.name = c('human','natur','physic','financial','social'),
                   minim = 0, maxim = 1, sd = 0.05) {

  num_obs <- nrow(datlvi)
  num_var <- ncol(datlvi)

  sim_results <- matrix(0, nrow = n, ncol = num_obs)
  colnames(sim_results) <- rownames(datlvi)

  array_sim <- array(0, dim = c(n, num_obs, num_var))

  for (i in 1:num_obs) {
    for (j in 1:num_var) {

      sim_vals <- rnorm(n = n, mean = datlvi[i, j], sd = sd)

      sim_vals <- pmax(pmin(sim_vals, maxim), minim)

      array_sim[, i, j] <- sim_vals
    }
  }

  for (k in 1:n) {
    dat_sim <- as.data.frame(array_sim[k, , ])
    rownames(dat_sim) <- rownames(datlvi)
    colnames(dat_sim) <- colnames(datlvi)

    res_lvi <- lvi(datlvi = dat_sim, sub.id = sub.id, dim.name = dim.name)
    sim_results[k, ] <- res_lvi$vulnerability.index
  }

  return(list(
    mean = apply(sim_results, 2, mean),
    raw_simulations = sim_results
  ))
}
