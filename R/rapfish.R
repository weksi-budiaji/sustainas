#' Rapfish calculation
#'
#' @description This function calculates Rapfish coordinates.
#'
#' @param datrap An input of data set (\emph{see} \strong{Details}).
#' @param num_fish A number of fish (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param standard A logical value for standard/ original (\emph{see} \strong{Details}).
#' @param idcol A numeric (vector) for id column (\emph{see} \strong{Details}).
#' @param idminim A numeric (vector) for minimum score (\emph{see} \strong{Details}).
#' @param idmaxim A numeric (vector) for maximum score (\emph{see} \strong{Details}).
#'
#' @details The data set is a data frame. The columns indicate variables where
#' the rows are the fish/ objects. \code{num_fish} indicates the number of
#' fish/ objects. For \code{minim} and  \code{maxim} arguments, they have default
#' values 0 and 10, respectively. A user can modify them.
#'
#' \code{standard} is a logical value with TRUE or FALSE where TRUE can be
#' applied for heterogenous scales among variables. \code{idcol} indicates
#' the column number of the heterogeneous scales. When heterogenous scales
#' are applied, \code{idminim} and \code{idmaxim} indicate the minimum and
#' maximum scores for the heterogenous scale, respectively. \code{idcol},
#' \code{idminim} and \code{idmaxim} must have an identical length.
#'
#' @return Function returns a list with \emph{7} length indicates the
#' fish/ object coordinates, stress value, variance explained per component,
#' good-bad-up-down coordinate, anchors coordinates, maximum, and minimum values.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#' @importFrom stats cmdscale
#' @importFrom stats dist
#' @importFrom stats prcomp
#' @importFrom stats sd
#' @importFrom stats runif
#' @importFrom stats aggregate
#'
#' @references Kavanagh, P., & Pitcher, T. J. 2004. Implementing Microsoft Excel software for Rapfish:
#' a technique for the rapid appraisal of fisheries status.
#' doi:http://dx.doi.org/10.14288/1.0074801
#'
#' @examples
#' #data simulation
#' data("social")
#' a <- rapfish(social)
#' a
#'
#' @export

rapfish <- function(datrap, num_fish = 12,minim=0,maxim=10,
                    standard = FALSE, idcol = NULL,
                    idminim = NULL, idmaxim = NULL) {

  if(any(is.na(datrap))) stop("Cannot handle missing values!")

  if((is.matrix(datrap)||is.data.frame(datrap))==FALSE)
    stop("The dataset must be a matrix or data frame object!")

  n_att <- ncol(datrap)
  n <- nrow(datrap)

  if(is.null(colnames(datrap)))
    colnames(datrap) <- 1:n_att
  if(is.null(rownames(datrap)))
    rownames(datrap) <- 1:n

  #anchor
  if (standard) {
    if (is.null(idcol)||is.null(idminim)||is.null(idmaxim)) stop("idcol,
      idminim, and idmaxim must be supplied with numeric/ vector indicating
      variable/ column of unequal scale!")
    if (length(idcol) != length(idminim) || length(idcol) != length(idmaxim) ||
        length(idminim) != length(idmaxim))
      stop("The length of idcol, idminim, dan idmaxim has to be equal!")

    anchor <- create_anchors(n_att, 0, 1)
    anchors <- anchor$anchors

    colnames(anchors) <- colnames(datrap)
    fisheries.dat <- datrap[1:num_fish,]

    # Standardisasi / min-max scaling
    fisheries.std <- scale_data(fisheries.dat, n_att, idcol, minim, maxim,
                                idminim, idmaxim)

    fisheries.raw <- rbind(anchors,fisheries.std)
  } else {

    anchor <- create_anchors(n_att, minim, maxim)
    anchors <- anchor$anchors

    colnames(anchors) <- colnames(datrap)
    fisheries.dat <- datrap[1:num_fish,]
    fisheries.raw <- rbind(anchors,fisheries.dat)
  }

  # #MDS and variance
  disttbl <- dist(fisheries.raw,"euclidean",diag=TRUE,upper=TRUE)
  coords <- cmdscale(disttbl,k=2,eig = TRUE)
  GOF <- coords$GOF
  coords <- coords$points

  coords2 <- transform_mds(coords)

  #Stress (modified)
  n_an <- anchor$n_an
  matS <- as.matrix(disttbl)[(n_an+5):nrow(coords2),(n_an+5):nrow(coords2)]
  matD <- as.matrix(dist(coords[(n_an+5):nrow(coords2),]))
  matE <- abs(matS-matD)
  # tend to large when n is large. it is better use mean sum square
  stress <- (sum(matE[lower.tri(matE)])^2/sum(matS[lower.tri(matS)])^2)/n
  s_stress <- round(sqrt(stress),3)
  return <- list(fish = coords2[-c(1:(4+n_an)),], stress = s_stress,
                 gof = GOF,
                 gbud = coords2[1:4,], anchor = coords2[5:(4+n_an),],
                 maxim = maxim, minim = minim)

}
