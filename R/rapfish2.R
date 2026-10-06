#' Multidimensional Rapfish calculation
#'
#' @description This function calculates Rapfish coordinates.
#'
#' @param datrap An input of data set (\emph{see} \strong{Details}).
#' @param num_fish A number of fish (\emph{see} \strong{Details}).
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param iddim A A numeric (vectors) for id column of each dimension (\emph{see} \strong{Details}).
#' @param standard A logical value for standard/ original (\emph{see} \strong{Details}).
#' @param idcol A numeric (vectors) for id column (\emph{see} \strong{Details}).
#' @param idminim A numeric (vectors) for minimum score (\emph{see} \strong{Details}).
#' @param idmaxim A numeric (vectors) for maximum score (\emph{see} \strong{Details}).
#' @param dim.name A character (vectors) for each dimension name (\emph{see} \strong{Details})..
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
#'
#' @references Kavanagh, P., & Pitcher, T. J. 2004. Implementing Microsoft Excel software for Rapfish:
#' a technique for the rapid appraisal of fisheries status.
#' doi:http://dx.doi.org/10.14288/1.0074801
#'
#' @examples
#' #data simulation
#' data("RapEqualScale15n10")
#' rest <- rapfish2(RapEqualScale15n10,num_fish = 10,minim=1,maxim=5,iddim = c(1,7,13,19,25))
#' rest
#'
#' @export

rapfish2 <- function(datrap, num_fish = 10, minim=0, maxim=10,
                     iddim = c(1,6,10), standard = FALSE, idcol = NULL,
                     idminim = NULL, idmaxim = NULL, dim.name = NULL) {

  if(any(is.na(datrap))) stop("Cannot handle missing values!")

  if((is.matrix(datrap)||is.data.frame(datrap))==FALSE)
    stop("The dataset must be a matrix or data frame object!")

  n_attall <- ncol(datrap)
  n <- nrow(datrap)

  if(is.null(colnames(datrap)))
    colnames(datrap) <- 1:n_attall
  if(is.null(rownames(datrap)))
    rownames(datrap) <- 1:n
  if (length(iddim) < 2)
    stop("Because it is a multidimensional composite RAP, the length iddim minimum is 2, for example iddim = c(1, 5, 8) indicating that dimension 1 from column 1 to 4, dimension 2 from column 5 to 7, and dimension 3 from column 8!")

  if (standard) {

    if (is.null(idcol)||is.null(idminim)||is.null(idmaxim)) stop("idcol,
      idminim, and idmaxim must be supplied with numeric/ vector indicating
      variable/ column of unequal scale!")
    if (length(idcol) != length(idminim) || length(idcol) != length(idmaxim) ||
        length(idminim) != length(idmaxim))
      stop("The length of idcol, idminim, dan idmaxim has to be equal!")

    # Standardisasi / min-max scaling
    fisheries.std <- scale_data(datrap, n_attall, idcol, minim, maxim,
                                idminim, idmaxim)
    datrap <- fisheries.std
    minim <- 0
    maxim <- 1
  }

  last <- c(iddim,ncol(datrap)+1)
  ndim <- length(iddim)
  datred <- distred <- distdim <- vector("list",ndim)
  for (i in 1:ndim) {
    datred[[i]] <- datrap[,iddim[i]:(last[i+1]-1)]
  }
  for (i in 1:ndim) {
    dat <- datred[[i]]
    n_att <- ncol(dat)
    n <- nrow(dat)

    #anchor
    anchor <- create_anchors(n_att, minim, maxim)
    anchors <- anchor$anchor

    colnames(anchors) <- colnames(dat)
    fisheries.dat <- dat[1:num_fish,]

    fisheries.raw <- rbind(anchors,fisheries.dat)

    #MDS and variance
    distance <- "euclidean"
    maty <- as.matrix(dist(fisheries.raw,distance,diag=TRUE,upper=TRUE)/
                        n_att)
    distred[[i]] <- maty

    #mds per dim
    disttbl <- maty
    coords <- cmdscale(disttbl,k=2,eig = TRUE)
    GOF <- coords$GOF
    coords <- coords$points
    coords2 <- transform_mds(coords)
    distdim[[i]] <- coords2[,1]

  }

  name_gen <- Reduce(intersect, lapply(distred, colnames))
  name_anch <- c("GOOD", "BAD", "UP", "DOWN")
  name_id <- sort(name_gen[grepl("^[0-9]+$", name_gen)])
  nama_fin <- c(name_anch, name_id)
  composite <- Reduce(`+`, lapply(distred, function(mat) {
    mat[nama_fin, nama_fin]
  }))

  disttbl <- composite
  coords <- cmdscale(disttbl,k=2,eig = TRUE)
  GOF <- coords$GOF
  coords <- coords$points

  coords2 <- transform_mds(coords)

  each_dim <- matrix(0,ndim,num_fish+1)
  colnames(each_dim) <- c("dimension",name_id)
  if (is.null(dim.name)) {
    each_dim[,1] <- 1:ndim
  } else {
    each_dim[,1] <- dim.name
  }

  for (i in 1:ndim) {
    each_dim[i,-1] <- distdim[[i]][name_id]
  }
  #Stress (modified)
  matS <- as.matrix(disttbl)[5:nrow(coords2),5:nrow(coords2)]
  matD <- as.matrix(dist(coords[5:nrow(coords2),]))
  matE <- abs(matS-matD)

  # tend to large when n is large. it is better use mean sum square
  stress <- (sum(matE[lower.tri(matE)])^2/sum(matS[lower.tri(matS)])^2)/n
  s_stress <- round(sqrt(stress),3)

  return <- list(fish = coords2[-c(1:4),], stress = s_stress,
                 gof = GOF, gbud = coords2[1:4,], anchor = coords2[1:4,],
                 idxdim = each_dim,
                 maxim = maxim, minim = minim)
}
