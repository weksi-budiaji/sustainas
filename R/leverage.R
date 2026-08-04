#' Leverage plot
#'
#' @description This function plot the leverage of Rapfish
#'
#' @param datori An input of data set (\emph{see} \strong{Details}).
#' @param datres An input of rapfish result (\emph{see} \strong{Details}).
#' @param title A title for the plot.
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
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


leverage <- function(datori,datres,title='',
                     minim=0, maxim=10, zoom.in = TRUE){

  n_att <- ncol(datori)
  num_fish <- nrow(datres$fish)
  xval <- datres$fish[,1]
  yval <- datres$fish[,2]
  lev <- matrix(0,nrow=n_att,ncol=2)
  colnames(lev) <- c("X_scores","Y_scores")
  for (i in 1:n_att){
    fish_lv <- datori[,-i]
    fish_lv.scaled <- rapfish(fish_lv, num_fish = num_fish, minim = minim,
                              maxim = maxim)
    lv_x <- fish_lv.scaled$fish[,1]
    lv_y <- fish_lv.scaled$fish[,2]
    sumsqx <- sum((lv_x-xval)^2)
    sumsqy <- sum((lv_y-yval)^2)
    lev[i,1] <- sqrt(sumsqx/num_fish)
    lev[i,2] <- sqrt(sumsqy/num_fish)
  }
  lev[lev > maxim] <- maxim
  levdf <- data.frame(score = apply(lev,1,mean),
                      Indicator = colnames(datori)
  )

  if (zoom.in==TRUE){
    maxim <- ceiling(max(levdf$score))
  } else {
    maxim <- maxim
  }

  plotbar <- ggplot(data=levdf, aes(x=.data$score, y=reorder(.data$Indicator,.data$score))) +
      geom_bar(stat="identity", fill="steelblue") +
      ggtitle(title) +
      coord_cartesian(xlim = c(minim, maxim)) +
      #scale_x_continuous(limits = c(minim,maxim)) +
      ylab("Indicator") +
      theme_bw() +
      theme(plot.title=element_text(hjust=0.5),
            axis.text.x = element_text(size = 10, face = "bold", color = "black"),
            axis.text.y = element_text(size = 10, face = "bold", color = "black"),
            axis.title.x = element_text(size = 12, face = "bold", color = "black"),
            axis.title.y = element_text(size = 12, face = "bold", color = "black"),
            panel.border = element_blank(),
            axis.line = element_line(color = "black", linewidth = 0.8),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            plot.subtitle=element_text(size=12)) +
      labs(subtitle = "RMS score change when selected attribute removed")
  return(list(data=levdf, plot = plotbar))
}
