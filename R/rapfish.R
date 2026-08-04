#' Rapfish calculation
#'
#' @description This function calculates Rapfish coordinates.
#'
#' @param datrap An input of data set (\emph{see} \strong{Details}).
#' @param num_fish A number of fish (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#'
#' @details The data set is a data frame. The columns indicate variables where
#' the rows are the fish/ objects. \code{num_fish} indicates the number of
#' fish/ objects. For \code{minim} and  \code{maxim} arguments, they have default
#' values 0 and 10, respectively. A user can modify them.
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

rapfish <- function(datrap, num_fish = 12,minim=0,maxim=10) {

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
  ol <- matrix(minim,n_att,n_att)
  ol[upper.tri(ol)] <- maxim
  ba <- matrix(maxim,n_att,n_att)
  ba[upper.tri(ba)] <- minim
  anchor <- rbind(ba,ol)
  n_an <- nrow(anchor)
  rownames(anchor) <- paste(rep('A',n_att*2),1:(n_att*2),sep='')

  #good bad up down
  gbup <- matrix(minim,nrow = 4,ncol=n_att)
  gbup[1,] <- maxim
  gbup[2,] <- minim
  gbup[3,1:ceiling(n_att/2)] <- maxim
  gbup[4,-c(1:ceiling(n_att/2))] <- maxim
  rownames(gbup) <- c('GOOD','BAD','UP','DOWN')

  #final anchor
  anchors <- rbind(gbup, anchor)

  colnames(anchors) <- colnames(datrap)
  fisheries.dat <- datrap[1:num_fish,]
  fisheries.raw <- rbind(anchors,fisheries.dat)

  #MDS and variance
  disttbl <- dist(fisheries.raw,"euclidean",diag=TRUE,upper=TRUE)
  coords <- cmdscale(disttbl,k=2,eig = TRUE)
  GOF <- coords$GOF
  coords <- coords$points

  ##topolar
  if (coords['GOOD',1] < coords['BAD',1]) {
    coords[,1] <- -coords[,1]  # flip horizontal
  }
  if (coords['UP',2] < coords['DOWN',2]) {
    coords[,2] <- -coords[,2]  # flip vertical
  }
  x <- coords['GOOD',1]
  y <-coords['GOOD',2]
  radius <- sqrt(x^2 + y^2);
  theta <- atan(y/x);
  theta <- theta*(180/pi)
  p1 <- c(radius,theta)
  x1 <- coords['BAD',1]
  y1 <- coords['BAD',2]
  radius1 <-  sqrt(x1^2 + y1^2);
  theta1 <- atan(y1/x1);
  theta1 <- theta1*(180/pi)
  p2 <- c(radius1,theta1)
  ##
  ##rotate
  angle <- -( mean(c(p1[2],p2[2])))
  theta2 <- angle* (pi/180)		# convert degrees to radians
  x3 <- coords[,1]
  y3 <- coords[,2]
  x4 <- (x3*cos(theta2)) - (y3*sin(theta2))
  y4 <- (x3*sin(theta2)) + (y3*cos(theta2))
  coords1 <- matrix(c(x4,y4),,2)
  rownames(coords1)= rownames(coords)
  x.min <- min(coords1[,1])
  x.max <- max(coords1[,1])
  y.min <- min(coords1[,2])
  y.max <- max(coords1[,2])

  #fix X and Y
  sc_x <- 100/(x.max-x.min)
  X_scores <- coords1[,1]*sc_x
  ad_x <- abs(X_scores[2])
  X_scores <- X_scores+ad_x

  sc_y <- 100/(y.max-y.min)
  Y_scores <- coords1[,2]*sc_y
  #ad_y=abs(Y_scores[2])
  #Y_scores=Y_scores+ad_y

  coords2 <- cbind(X_scores,Y_scores)

  #Stress (modified)
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

