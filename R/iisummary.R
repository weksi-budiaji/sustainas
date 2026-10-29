#' Influence interest summary for montecarlo simulation
#'
#' @description This function plot the montcarlo plot summary
#'
#' @param iires An input of influene-interest montecarlo result (\emph{see} \strong{Details}).
#' @param sub.id A column id of each dimension (\emph{see} \strong{Details}).
#' @param title A title for the plot (\emph{see} \strong{Details}).
#' @param tot.id A total number of columns of the data (\emph{see} \strong{Details}).
#' @param min.influ A minimum score of influence (\emph{see} \strong{Details}).
#' @param max.influ A maximum score of influence (\emph{see} \strong{Details}).
#' @param min.inter A minimum score of interest (\emph{see} \strong{Details}).
#' @param max.inter A maximum score of interest (\emph{see} \strong{Details})
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
#' data("sldata")
#' iiplot(sldata)
#' hasil_mc_ii <- mc_ii(n = 100, dat = sldata, sub.id = c(1, 6),
#' min.influ = 1, max.influ = 5, min.inter = 1, max.inter = 5, sd = 0.5)
#' iisummary(hasil_mc_ii,sub.id = c(1, 6),  min.influ = 1, max.influ = 5,
#' min.inter = 1, max.inter = 5, tot.id = 10)
#'
#' @export


iisummary <- function(iires, title="", sub.id = NULL, tot.id = NULL,
                      min.influ = 1, max.influ = 100,
                      min.inter = 1, max.inter = 100) {

  if(is.null(sub.id))
    stop("sub.id indicating the dimension id must be supplied!")
  if(is.null(tot.id))
    stop("tot.id indicating the total number of columns must be supplied!")

  Influence <- as.numeric(iires$raw_influ)
  Interest <- as.numeric(iires$raw_inter)
  obj <- rep(1:ncol(iires$raw_influ), each = nrow(iires$raw_influ))
  idx <- c(sub.id[-1],(tot.id+1))

  n.sub <- idx-sub.id
  mat.text <- matrix(c(max.influ*(n.sub[2])/4,min.inter,
                       max.influ*3*(n.sub[1])/4,min.inter,
                       max.influ*(n.sub[2])/4,max.inter*(n.sub[2]),
                       max.influ*3*(n.sub[1])/4,max.inter*(n.sub[2])),
                     ncol=2,byrow = TRUE)
  colnames(mat.text) <- c("Influence", "Interest")
  rownames(mat.text) <- c("Crowd", "Context.setter","Subject","Key.player")

  datbox <- data.frame(Influence, Interest, obj)
  centroids <- aggregate(datbox[, c("Influence", "Interest")],
                         by = list(obj = datbox$obj),
                         FUN = mean)

  plot <- ggplot(data=datbox, aes(x=.data$Influence, y=.data$Interest)) +
    geom_point() +
    ggtitle(title) +
    theme_classic() +
    scale_x_continuous(limits = c(min.influ,max.influ*(n.sub[1]))) +
    scale_y_continuous(limits = c(min.inter,max.inter*(n.sub[2]))) +
    geom_text(data=mat.text,aes(label=rownames(mat.text)),
              size = 6, vjust = 0, fontface = "bold", color = "black") +
    geom_vline(xintercept=max.influ*(n.sub[1])/2, linetype="dashed", color = "red") +
    geom_hline(yintercept=max.inter*(n.sub[2])/2, linetype="dashed", color = "red") +
    theme(plot.title = element_text(hjust = 0.5),
          axis.text.x = element_text(size = 10, face = "bold", color = "black"),
          axis.text.y = element_text(size = 10, face = "bold", color = "black"),
          panel.border = element_blank(),
          axis.line = element_line(color = "black", linewidth = 0.8),
          legend.position = "none")

  plot <- plot +
    geom_point(data = centroids,
               aes(x = .data$Influence, y = .data$Interest,
                   color = factor(.data$obj)),
               size = 4, shape = 1, stroke = 1.5) +
    geom_text(data = centroids,
              aes(x = .data$Influence, y = .data$Interest,
                  label = .data$obj),
              vjust = -1, size = 3)

  return(plot)
}
