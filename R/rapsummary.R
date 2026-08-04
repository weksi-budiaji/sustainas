#' Rapfish summary for montecarlo simulation
#'
#' @description This function plot the montcarlo plot summary
#'
#' @param datbox An input of montecarlo result (\emph{see} \strong{Details}).
#' @param title A title for the plot.
#' @param scatter A logical input for a scatter plot or a circled-boxplot.
#'
#' @details The data set is a rapfist result from rapfish function.
#' For \code{maxim} and  \code{minim} arguments, they have default
#' values 10 and 0, respectively. A user can modify them.
#'
#' @return Function returns a plot of montecarlo summary.
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
#' b1 <- mc_triangular(10,social)
#' b2 <- mc_normal(10,social)
#' rapsummary(b1)
#' rapsummary(b2)
#'
#' @export


rapsummary <- function(datbox, title="", scatter = TRUE) { #summary of montecarlo

  if (scatter) {

    if(inherits(datbox, "data.frame")==FALSE)
      datbox <- as.data.frame(datbox)
    colnames(datbox) <- c("x", "y", "fish")

    centroids <- aggregate(datbox[, c("x", "y")],
                           by = list(fish = datbox$fish),
                           FUN = mean)

    plot <- ggplot(datbox) +
      geom_point(aes(x = .data$x, y = .data$y, color = factor(.data$fish)),
                 alpha = 0.4, size = 1.2) +
      ggtitle(title) +
      xlab("X_scores") +
      ylab("Y_scores") +
      coord_cartesian(xlim = c(0, 100), ylim = c(-50, 50)) +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5),
            axis.text.x = element_text(size = 10, face = "bold", color = "black"),
            axis.text.y = element_text(size = 10, face = "bold", color = "black"),
            panel.border = element_blank(),
            axis.line = element_line(color = "black", linewidth = 0.8),
            legend.position = "none")

    plot <- plot +
      geom_point(data = centroids,
                 aes(x = .data$x, y = .data$y, color = factor(.data$fish)),
                 size = 4, shape = 1, stroke = 1.5) +
      geom_text(data = centroids,
                aes(x = .data$x, y = .data$y, label = .data$fish),
                vjust = -1, size = 3)

  } else {

    plot.x <- ggplot(datbox) + geom_boxplot(aes(factor(.data$fish), .data$x))
    plot.y <- ggplot(datbox) + geom_boxplot(aes(factor(.data$fish), .data$y))
    plot.x <- layer_data(plot.x)[,1:6]
    plot.y <- layer_data(plot.y)[,1:6]
    colnames(plot.x) <- paste0("x.", gsub("y", "", colnames(plot.x)))
    colnames(plot.y) <- paste0("y.", gsub("y", "", colnames(plot.y)))
    df <- cbind(plot.x, plot.y)
    df$category <- sort(unique(datbox[,3]))
    ppt <- df[,c(3,9)]
    plot <- #ggplot(df, aes(fill = factor(category), color = factor(category))) +
      ggplot(data=df) +
      geom_point(data=ppt,aes(x=.data$x.middle,y=.data$y.middle),size=10,alpha=0.2) +
      ggtitle(title)+

      # whiskers for x-axis dimension with ends
      geom_segment(aes(x = .data$x.min, y = .data$y.middle, xend = .data$x.max, yend = .data$y.middle)) + #whiskers
      geom_segment(aes(x = .data$x.min, y = .data$y.lower*0.5, xend = .data$x.min, yend = .data$y.upper*0.5)) + #lower end
      geom_segment(aes(x = .data$x.max, y = .data$y.lower*0.5, xend = .data$x.max, yend = .data$y.upper*0.5)) + #upper end

      # whiskers for y-axis dimension with ends
      geom_segment(aes(x = .data$x.middle, y = .data$y.min, xend = .data$x.middle, yend = .data$y.max)) + #whiskers
      geom_segment(aes(x = .data$x.lower+(.data$x.upper-.data$x.lower)*0.25, y = .data$y.min,
                       xend = .data$x.upper-(.data$x.upper-.data$x.lower)*0.25, yend = .data$y.min)) + #lower end
      geom_segment(aes(x = .data$x.lower+(.data$x.upper-.data$x.lower)*0.25, y = .data$y.max,
                       xend = .data$x.upper-(.data$x.upper-.data$x.lower)*0.25, yend = .data$y.max),
                   show.legend=FALSE) + #upper end

      xlab("X_scores") + ylab("Y_scores") +
      coord_cartesian(xlim = c(0, 100), ylim = c(-50,50)) +
      theme_classic() +
      theme(plot.title=element_text(hjust=0.5),
            legend.position="none")
  }

  return(plot)
}

