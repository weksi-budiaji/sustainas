#' Radar plot of sustainability livelihood analysis
#'
#' @description This function plot the sustainability livelihood in radar
#' plot depending on the included number of dimensions.
#'
#' @param dat An input of data set (\emph{see} \strong{Details}).
#' @param title A title for the plot (\emph{see} \strong{Details}).
#' @param lvi.out An indicator whether the input data from lvi function (\emph{see} \strong{Details}).
#' @param object A numeric input for the object id (\emph{see} \strong{Details}).
#'
#' @details The data set is a n x 2 data frame or matrix object. The sustainability
#' livelihood radar plot draws all included dimensions.
#' For \code{title}, user can input additional information for the plot title.
#' For \code{lvi.out} is indicator input whether \code{TRUE} or
#' \code{FALSE} while \code{object} must be a numeric with a length of 1.
#' It is valid only \code{lvi.out = TRUE}.
#'
#' @return Function returns a radar plot indicating the vulnerability score.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#'
#' @examples
#' #data simulation
#' data("three")
#' rest <- lvi(three, sub.id = c(1,9,16),dim.name = c("Social","Institution","Technology"))
#' radarplot(rest,object = 5)
#'
#' #non lvi output
#' datex <- data.frame(
#' dimension = c("Social", "Institution","Technology"),
#' score = c(5,7,9))
#' radarplot(datex,lvi.out = FALSE)
#'
#' @export

radarplot <- function(dat, title="",lvi.out=TRUE, object=NULL) {

  if(any(is.na(dat))) stop("Cannot handle missing values!")

  if (lvi.out==TRUE) {
    if(names(dat)[2]!="dimension.score")
      stop("data set is not lvi.output! choose lvi.out=FALSE instead.")
    if(is.null(object))
      stop("argument 'object' is null. it must be supplied with
           a numeric indicating a chosen object")
    if(length(object)!=1)
      stop("Object must be supplied with a numeric indicating a chosen object")

    dt <- as.data.frame(t(dat$dimension.score[object,,drop=FALSE]))
    site <- colnames(dt)
    dt$dimension <- rownames(dt)
    colnames(dt)[1] <- "score"
    plot <- rdrpl(dt, title = paste(title, site, sep = " "))

  } else {

    if((is.matrix(dat)||is.data.frame(dat))==FALSE)
      stop("The dataset must be a matrix or data frame object!")
    if(ncol(dat)!=2)
      stop("data set is not an n x 2 matrix/ data frame.")
    if(sum(colnames(dat)=="score") + sum(colnames(dat)=="dimension") != 2)
      stop("coloumn name of the data set must be 'dimension' and 'score'.")

    plot <- rdrpl(dat, title = title)
  }
  return(plot)
}

