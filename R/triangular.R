#' Montecarlo triangular method
#'
#' @description This function generate montecarlo simulation with triangular method.
#'
#' @param n A number of data simulation (\emph{see} \strong{Details}).
#' @param dat An input of data set (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#'
#' @details The data set \code{dat} arguments is a data set as a source
#' data for the simulation.
#' For \code{maxim} and  \code{minim} arguments, they have default
#' values 10 and 0, respectively. A user can modify them.
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
#' data("social")
#' b1 <- mc_triangular(10,social)
#' b1
#'
#' @export


mc_triangular <- function(n=10, dat, minim = 0, maxim = 10) {

  num_fish <- nrow(dat)
  n_att <- ncol(dat)
  datsimul <- datsumm <- datrap <- coord <- vector("list", num_fish)
  for (i in 1:num_fish) {
    datsimul[[i]] <- matrix(0,n,n_att)
    for (j in 1:n_att){
      datsimul[[i]][,j] <- triangular(n,minim=minim,maxim=maxim,lk=dat[i,j])
    }
    datsumm[[i]] <- apply(datsimul[[i]],2,summary)
    datrap[[i]] <- rapfish(datsimul[[i]],num_fish = n, minim = minim,
                           maxim=maxim)
    coord[[i]] <- matrix(unlist(datrap[[i]][1]),nrow = n)
  }
  allsim <- cbind(do.call(rbind,coord),rep(c(1:num_fish),each=n))
  colnames(allsim) <- c('x','y','fish')
  return(allsim)
}
