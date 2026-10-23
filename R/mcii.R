#' Montecarlo normal method for influence-interest
#'
#' @description This function generate montecarlo simulation with normal method.
#'
#' @param n A number of data simulation (\emph{see} \strong{Details}).
#' @param dat An input of data set (\emph{see} \strong{Details}).
#' @param sub.id A column id of each dimension (\emph{see} \strong{Details}).
#' @param min.influ A minimum score of influence (\emph{see} \strong{Details}).
#' @param max.influ A maximum score of influence (\emph{see} \strong{Details}).
#' @param min.inter A minimum score of interest (\emph{see} \strong{Details}).
#' @param max.inter A maximum score of interest (\emph{see} \strong{Details}).
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


mc_ii <- function(n = 100, dat, sub.id = c(1, 6),
                  min.influ = 1, max.influ = 5,
                  min.inter = 1, max.inter = 5,
                  sd = 1) {

  if(any(is.na(dat)))
    stop("Cannot handle missing values!")
  if(length(sub.id) != 2)
    stop("Only handle two dimension of Influence and Interest!")

  num_obs <- nrow(dat)
  num_var <- ncol(dat)

  idx <- c(sub.id[-1], (num_var + 1))

  sim_influ <- matrix(0, nrow = n, ncol = num_obs)
  sim_inter <- matrix(0, nrow = n, ncol = num_obs)
  colnames(sim_influ) <- colnames(sim_inter) <- rownames(dat)

  for (k in 1:n) {
    dat_sim <- matrix(0, nrow = num_obs, ncol = num_var)

    for (i in 1:num_obs) {
      # Influence
      for (j in sub.id[1]:(idx[1] - 1)) {
        sim_val <- rnorm(1, mean = dat[i, j], sd = sd)
        dat_sim[i, j] <- max(min.influ, min(max.influ, sim_val))
      }

      #Interest
      for (j in sub.id[2]:(idx[2] - 1)) {
        sim_val <- rnorm(1, mean = dat[i, j], sd = sd)
        dat_sim[i, j] <- max(min.inter, min(max.inter, sim_val))
      }
    }

    xy_sim <- matrix(0, num_obs, 2)
    for (d in 1:2) {
      mat_dim <- dat_sim[, c(sub.id[d]:(idx[d] - 1))]
      xy_sim[, d] <- apply(mat_dim, 1, sum)
    }

    sim_influ[k, ] <- xy_sim[, 1]
    sim_inter[k, ] <- xy_sim[, 2]
  }

  return(list(
    mean_influ = apply(sim_influ, 2, mean),
    mean_inter = apply(sim_inter, 2, mean),
    raw_influ = sim_influ,
    raw_inter = sim_inter,
  ))
}
