#' Montecarlo method for RAPFISH multi-dimensional
#'
#' @description This function generate montecarlo simulation with normal method.
#'
#' @param n A number of data simulation (\emph{see} \strong{Details}).
#' @param dat An input of data set (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param sd A standard deviation for the normal distribution (\emph{see} \strong{Details}).
#' @param iddim A A numeric (vectors) for id column of each dimension (\emph{see} \strong{Details}).
#' @param standard A logical value for standard/ original (\emph{see} \strong{Details}).
#' @param idcol A numeric (vectors) for id column (\emph{see} \strong{Details}).
#' @param idminim A numeric (vectors) for minimum score (\emph{see} \strong{Details}).
#' @param idmaxim A numeric (vectors) for maximum score (\emph{see} \strong{Details}).
#' @param dim.name A character (vectors) for each dimension name (\emph{see} \strong{Details})..
#'
#'
#' @details \code{n} is a number of the data simulation.
#' The data set \code{dat} arguments is a data set as a source
#' data for the simulation.
#' For \code{maxim} and  \code{minim} arguments, they have default
#' values 10 and 0, respectively. A user can modify them.
#' \code{sd} set the dispersion tendency of the simulation.
#'
#' \code{iddim} is a numeric vector to indicate the first column index of each
#' dimension.
#' \code{standard} is a logical value with TRUE or FALSE where TRUE can be
#' applied for heterogenous scales among variables. \code{idcol} indicates
#' the column number of the heterogeneous scales. When heterogenous scales
#' are applied, \code{idminim} and \code{idmaxim} indicate the minimum and
#' maximum scores for the heterogenous scale, respectively. \code{idcol},
#' \code{idminim} and \code{idmaxim} must have an identical length.
#' \code{dim.name} is the name for the dimensions.
#'
#' @return Function returns coordinates of Montecarlo simulation.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#' @importFrom stats rnorm
#'
#' @references Kavanagh, P., & Pitcher, T. J. 2004. Implementing Microsoft Excel software for Rapfish:
#' a technique for the rapid appraisal of fisheries status.
#' doi:http://dx.doi.org/10.14288/1.0074801
#'
#' @examples
#' #data simulation
#' data("RapEqualScale15n10")
#' rest <- rapfish2(RapEqualScale15n10, num_fish = 10, minim=1, maxim=5,
#' iddim = c(1,7,13,19,25))
#' rest
#' MCmult <- mc_normal2(10, RapEqualScale15n10, minim = 1, maxim = 5,
#' iddim = c(1,7,13,19,25), sd = 0.25)
#' MCmult$coord
#' rapsummary(MCmult$coord)
#'
#' @export

mc_normal2 <- function(n = 10, dat, minim = 0, maxim = 10, sd = 1,
                       iddim, standard = FALSE,
                       idcol = NULL, idminim = NULL, idmaxim = NULL,
                       dim.name = NULL) {

  num_fish <- nrow(dat)
  n_att    <- ncol(dat)

  datsimul <- datsum <- datrap <- coord <- idxlist <- vector("list", num_fish)

  for (i in 1:num_fish) {

    # normal each atributte
    datsimul[[i]] <- matrix(0, n, n_att)
    for (j in 1:n_att) {
      datsimul[[i]][, j] <- rnorm(n = n, mean = dat[i, j], sd = sd)
    }

    # run rapfish2
    datrap[[i]] <- rapfish2(datsimul[[i]],
                            num_fish = n,
                            minim    = minim,
                            maxim    = maxim,
                            iddim    = iddim,
                            standard = standard,
                            idcol    = idcol,
                            idminim  = idminim,
                            idmaxim  = idmaxim,
                            dim.name = dim.name)

    # composite coordinate (fish)
    coord[[i]] <- matrix(unlist(datrap[[i]][1]), nrow = n)

    # score each dimensision
    idxlist[[i]] <- datrap[[i]]$idxdim
  }

  # combine composite coordinate
  allsim <- cbind(do.call(rbind, coord),
                  rep(1:num_fish, each = n))
  colnames(allsim) <- c("x", "y", "fish")

  # idxdim: row = dim, column = "dimension" + fish
  allidx <- do.call(rbind, idxlist)

  return(list(coord = allsim, idxdim = allidx))
}



