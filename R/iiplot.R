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
#' @param standard A logical value for standard/ original (\emph{see} \strong{Details}).
#' @param idcol A numeric (vectors) for id column (\emph{see} \strong{Details}).
#' @param idminim A numeric (vectors) for minimum score (\emph{see} \strong{Details}).
#' @param idmaxim A numeric (vectors) for maximum score (\emph{see} \strong{Details}).
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

iiplot <- function(dat,sub.id = c(1, 6), title = "", min.influ=1,
                   max.influ=5, min.inter=1, max.inter=5,
                   standard = FALSE, idcol = NULL,
                   idminim = NULL, idmaxim = NULL) {

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

  if (standard) {
    if (is.null(idcol)||is.null(idminim)||is.null(idmaxim)) stop("idcol,
      idminim, and idmaxim must be supplied with numeric/ vector indicating
      variable/ column of unequal scale!")
    if (length(idcol) != length(idminim) || length(idcol) != length(idmaxim) ||
        length(idminim) != length(idmaxim))
      stop("The length of idcol, idminim, dan idmaxim has to be equal!")

    #influence data
    dat_influ <- dat[,c(sub.id[1]:(idx[1]-1))]
    n_col_influ <- idx[1]-sub.id[1]
    idcol_influ <- idcol[idcol<sub.id[2]]
    length_id_influ <- length(idcol_influ)
    if (length(idcol_influ==0)) {
      dat_influ <- scale_data(dat_influ, n_col_influ, 1:n_col_influ,
                              min.influ, max.influ,
                              min.influ, max.influ, all = TRUE)
    } else {
      idminim_influ <- idminim[1:length_id_influ]
      idmaxim_influ <- idmaxim[1:length_id_influ]
      dat_influ <- scale_data(dat_influ, n_col_influ, idcol_influ,
                              min.influ, max.influ,
                              min.influ, max.influ)
    }


    #interest data
    dat_inter <- dat[,c(sub.id[2]:(idx[2]-1))]
    n_col_inter <- idx[2]-sub.id[2]
    idcol_inter <- idcol[idcol>=sub.id[2]]-(sub.id[2]-1)

    if (length(idcol_inter==0)) {
      dat_inter <- scale_data(dat_inter, n_col_inter, 1:n_col_inter,
                              min.inter, max.inter,
                              min.inter, max.inter, all = TRUE)
    } else {
      idminim_inter <- idminim[-c(1:length_id_influ)]
      idmaxim_inter <- idmaxim[-c(1:length_id_influ)]
      dat_inter <- scale_data(dat_inter, n_col_inter, idcol_inter,
                              min.inter, max.inter,
                              idminim_inter, idmaxim_inter)
    }

    dat <- cbind(dat_influ,dat_inter)
    min.influ <- min.inter <- 0
    max.influ <- max.inter  <- 1
  }

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
