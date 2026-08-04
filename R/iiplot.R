#' Influence  interest plot
#'
#' @description This function plot the influence-interest
#' dimensions for governance leve (stakeholder analysis).
#'
#' @param dat An input of data set (\emph{see} \strong{Details}).
#' @param sub.id A column id of each dimension (\emph{see} \strong{Details}).
#' @param title A title for the plot (\emph{see} \strong{Details}).
#' @param min.influ A minimum score of influence (\emph{see} \strong{Details}).
#' @param max.influ A maximum score of influence (\emph{see} \strong{Details}).
#' @param min.inter A minimum score of interest (\emph{see} \strong{Details}).
#' @param max.inter A maximum score of interest (\emph{see} \strong{Details}).
#'
#' @details The data set is a n x c data frame or matrix object. The influence-interest
#' plot draws only two dimensions of influence (x) and interest (y).
#' For \code{sub.id}, user has to input the first column of each dimension,
#' for example \code{sub.id=c(1,6)} meaning that the influence indicators are
#' column 1 to 5 while the rests are the interest indicators.
#' Minimum and maximum scores for each dimension are also defined in the
#' \code{min.influ}, \code{max.influ}, \code{min.inter}, and \code{max.inter}.
#'
#' @return Function returns a list of coordinate scores and
#' two dimension plot.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#'
#' @references Bryson, J. M. 2004.
#' What to do when Stakeholders matter.
#' Public Management Review, 6(1), 21–53.
#' doi:https://doi.org/10.1080/14719030410001675722
#'
#'
#' @examples
#' #data simulation
#' data("sldata")
#' iiplot(sldata)
#'
#' @export

iiplot <- function(dat,sub.id = c(1, 6), title = "", min.influ=0, max.influ=5,
                   min.inter=0, max.inter=5) {

  if(any(is.na(dat))) stop("Cannot handle missing values!")
  if(length(sub.id)!=2) stop("Only handle two dimension of Influence and Interest!")
  if((is.matrix(dat)||is.data.frame(dat))==FALSE)
    stop("The dataset must be a matrix or data frame object!")

  n.comp <- length(sub.id)
  n.obj <- nrow(dat)
  idx <- c(sub.id[-1],(ncol(dat)+1))
  xy <- matrix(0,n.obj,2)
  rownames(xy) <- rownames(dat)
  colnames(xy) <- c("Influence","Interest")
  for (i in 1:n.comp) {
    mat <- dat[,c(sub.id[i]:(idx[i]-1))]
    xy[,i] <- apply(mat,1,sum)
  }
  n.sub <- idx-sub.id
  mat.text <- matrix(c(max.influ*(n.sub[2])/4,min.inter,
                       max.influ*3*(n.sub[1])/4,min.inter,
                       max.influ*(n.sub[2])/4,max.inter*(n.sub[2]),
                       max.influ*3*(n.sub[1])/4,max.inter*(n.sub[2])),
                     ncol=2,byrow = TRUE)
  colnames(mat.text) <- colnames(xy)
  rownames(mat.text) <- c("Crowd", "Context.setter","Subject","Key.player")
  plot <- ggplot(data=xy, aes(x=.data$Influence, y=.data$Interest)) +
    geom_point() +
    scale_x_continuous(limits = c(min.influ,max.influ*(n.sub[1]))) +
    scale_y_continuous(limits = c(min.inter,max.inter*(n.sub[2]))) +
    geom_text(aes(label=rownames(xy)),
              size = 3, vjust = -0.5) +
    geom_text(data=mat.text,aes(label=rownames(mat.text)),
              size = 6, vjust = 0, fontface = "bold", color = "black") +
    geom_vline(xintercept=max.influ*(n.sub[1])/2, linetype="dashed", color = "red") +
    geom_hline(yintercept=max.inter*(n.sub[2])/2, linetype="dashed", color = "red") +
    ggtitle(title)+
    theme_bw() +
    theme(plot.title=element_text(hjust=0.5, size = 14, face = "bold", color = "black"),
          axis.text.x = element_text(size = 10, face = "bold", color = "black"),
          axis.text.y = element_text(size = 10, face = "bold", color = "black"),
          axis.title.x = element_text(size = 14, face = "bold", color = "black"),
          axis.title.y = element_text(size = 14, face = "bold", color = "black")
          )
  return(list(data=xy, plot=plot))
}

