#' Leverage plot
#'
#' @description This function plot the leverage of Rapfish
#'
#' @param datori An input of data set (\emph{see} \strong{Details}).
#' @param datres An input of rapfish result (\emph{see} \strong{Details}).
#' @param title A title for the plot.
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#' @param iddim A A numeric (vectors) for id column of each dimension (\emph{see} \strong{Details}).
#' @param standard A logical value for standard/ original (\emph{see} \strong{Details}).
#' @param idcol A numeric (vector) for id column (\emph{see} \strong{Details}).
#' @param idminim A numeric (vector) for minimum score (\emph{see} \strong{Details}).
#' @param idmaxim A numeric (vector) for maximum score (\emph{see} \strong{Details}).
#' @param zoom.in A logical input for a zoom in leverage plot.
#'
#' @details \code{datori} is the original data set, while
#' \code{datres} is the corresponding rapfist result from the rapfish function.
#' For \code{minim} and  \code{maxim} arguments, they have default
#' values 0 and 10, respectively. A user can modify them.
#'
#' @return Function returns list of leverage scores and
#' a plot of leverage.
#'
#'@importFrom stats reorder
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
#' res <- rapfish(social)
#' leverage(social,res,title = "social")
#'
#' @export


leverage2 <- function (datori, datres, title = "", minim = 1, maxim = 5,
                       iddim = NULL, standard = FALSE, idcol = NULL,
                       idminim = NULL, idmaxim = NULL,
                       zoom.in = TRUE)
{

  if (length(iddim) < 2)
    stop("Because it is leverage for a multidimensional RAPFISH, the length iddim minimum is 2, for example iddim = c(1, 5, 8) indicating that dimension 1 from column 1 to 4, dimension 2 from column 5 to 7, and dimension 3 from column 8!")

  n_att <- ncol(datori)
  num_fish <- nrow(datres$fish)
  ndim <- length(iddim)
  lastind <- c(iddim[-1]-1,n_att)
  xval <- datres$fish[, 1]
  yval <- datres$fish[, 2]
  lev <- matrix(0, nrow = n_att, ncol = 2)
  colnames(lev) <- c("X_scores", "Y_scores")

  if (standard) {
    if (is.null(idcol)||is.null(idminim)||is.null(idmaxim)) stop("idcol,
      idminim, and idmaxim must be supplied with numeric/ vector indicating
      variable/ column of unequal scale!")
    if (length(idcol) != length(idminim) || length(idcol) != length(idmaxim) ||
        length(idminim) != length(idmaxim))
      stop("The length of idcol, idminim, dan idmaxim has to be equal!")

    for (j in 1:ndim){
      idxstart <- iddim[j]
      idxend <- lastind[j]
      iddim2 <- c(iddim[1:j],iddim[-c(1:j)]-1) #index dimension
      idcol2 <- idcol - as.numeric(idcol > iddim[j])
      idminim2 <- idminim
      idmaxim2 <- idmaxim

      for (i in idxstart:idxend) {
        fish_lv <- datori[, -i]

        # TRUE -> right i
        is_alive <- idcol2 > i

        idminim_aktual <- idminim2[is_alive]
        idmaxim_aktual <- idmaxim2[is_alive]

        idcol_aktual <- idcol2[is_alive] - 1

        fish_lv.scaled <- rapfish2(fish_lv, num_fish = num_fish,
                                   minim = minim, maxim = maxim,
                                   iddim = iddim2,
                                   standard = TRUE, idcol = idcol_aktual,
                                   idminim = idminim_aktual,
                                   idmaxim = idmaxim_aktual)
        lv_x <- fish_lv.scaled$fish[, 1]
        lv_y <- fish_lv.scaled$fish[, 2]
        sumsqx <- sum((lv_x - xval)^2)
        sumsqy <- sum((lv_y - yval)^2)
        lev[i, 1] <- sqrt(sumsqx/num_fish)
        lev[i, 2] <- sqrt(sumsqy/num_fish)
      }
    }
    levdf <- data.frame(score = apply(lev,1,mean),
                        Indicator = colnames(datori)
    )
    levdf$score <- levdf$score/ sum(levdf$score)
    minim <- 0
    if (zoom.in==TRUE){
      maxim <- max(levdf$score)
    } else {
      maxim <- 1
    }
    sub <- "Proportion of RMS score change when selected attribute removed"

  } else {
    for (j in 1:ndim){
      idxstart <- iddim[j]
      idxend <- lastind[j]
      iddim2 <- c(iddim[1:j],iddim[-c(1:j)]-1) #index dimension
      for (i in idxstart:idxend) {
        fish_lv <- datori[, -i]
        fish_lv.scaled <- rapfish2(fish_lv, num_fish = num_fish,
                                   minim = minim, maxim = maxim,
                                   iddim = iddim2)
        lv_x <- fish_lv.scaled$fish[, 1]
        lv_y <- fish_lv.scaled$fish[, 2]
        sumsqx <- sum((lv_x - xval)^2)
        sumsqy <- sum((lv_y - yval)^2)
        lev[i, 1] <- sqrt(sumsqx/num_fish)
        lev[i, 2] <- sqrt(sumsqy/num_fish)
      }
    }
    lev[lev > maxim] <- maxim
    levdf <- data.frame(score = apply(lev, 1, mean),
                        Indicator = colnames(datori))
    if (zoom.in == TRUE) {
      maxim <- ceiling(max(levdf$score))
    }
    else {
      maxim <- maxim
    }
    sub <- "RMS score change when selected attribute removed"
  }

  plotbar <- ggplot(data = levdf,
                    aes(x = .data$score,
                        y = reorder(.data$Indicator, .data$score))) +
    geom_bar(stat = "identity", fill = "steelblue") +
    ggtitle(title) + coord_cartesian(xlim = c(minim, maxim)) +
    ylab("Indicator") + theme_bw() +
    theme(plot.title = element_text(hjust = 0.5),
          axis.text.x = element_text(size = 10, face = "bold",
                                     color = "black"),
          axis.text.y = element_text(size = 10, face = "bold",
                                     color = "black"),
          axis.title.x = element_text(size = 12, face = "bold",
                                      color = "black"),
          axis.title.y = element_text(size = 12,
                                      face = "bold",
                                      color = "black"),
          panel.border = element_blank(),
          axis.line = element_line(color = "black", linewidth = 0.8),
          panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          plot.subtitle = element_text(size = 12)) +
    labs(subtitle = sub)

  return(list(data = levdf, plot = plotbar))
}
