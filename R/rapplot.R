#' Rapfish plot
#'
#' @description This function plot the Rapfish result
#'
#' @param datplot An input of rapfish result (\emph{see} \strong{Details}).
#' @param title A title for the plot.
#' @param minim A minimum score (\emph{see} \strong{Details}).
#' @param maxim A maximum score (\emph{see} \strong{Details}).
#'
#' @details The data set is a rapfist result from rapfish function.
#' For \code{minim} and \code{maxim} arguments, they have default
#' values 0 and 10, respectively. A user can modify them.
#'
#' @return Function returns a plot of rapfish result.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#' @import ggplot2
#'
#' @references Kavanagh, P., & Pitcher, T. J. 2004. Implementing Microsoft Excel software for Rapfish:
#' a technique for the rapid appraisal of fisheries status.
#' doi:http://dx.doi.org/10.14288/1.0074801
#'
#' @examples
#' #data simulation
#' data("social")
#' a <- rapfish(social)
#' rapplot(a, title = "social")
#'
#' @export


rapplot <- function(datplot,title='',minim=0,maxim=10) {

  coords2 <- rbind(datplot$gbud,datplot$anchor,datplot$fish)
  num_fish <- nrow(datplot$fish)
  compass <- datplot$gbud
  anchorsplot <- datplot$anchor

  #Plot
  shp <- factor(rep(c(2:1),c(nrow(coords2)-num_fish,num_fish)))
  colr <- factor(c(rep(c(1:2),c(4,nrow(anchorsplot))),3:(num_fish+2)))
  ggplot(data=coords2, aes(x=.data$X_scores, y=.data$Y_scores)) +
    geom_point(aes(shape=shp,colour=colr),show.legend=FALSE) +
    geom_text(data=datplot$fish,aes(label=rownames(datplot$fish)),
              size = 3, vjust = -0.5) +
    geom_text(data=compass,aes(label=rownames(compass)),
              size = 4, vjust = -0.5, fontface = "bold") +
    ggtitle(title)+
    labs(subtitle = paste("Goodness of fit = ",
                          round(datplot$gof[2],3)*100,"% and stress = ",
                          datplot$stress,sep="")) +
    #scale_x_continuous(limits = c(0,100)) +
    theme_bw() +
    theme(plot.title=element_text(hjust=0.5),
          axis.text.x = element_text(size = 10, face = "bold", color = "black"),
          axis.text.y = element_text(size = 10, face = "bold", color = "black"),
          panel.border = element_blank(),
          axis.line = element_line(color = "black", linewidth = 0.8),
          plot.subtitle=element_text(size=12))
}
