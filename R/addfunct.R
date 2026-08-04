
triangular <- function(n=10,minim=0,maxim=10,lk=5) {
  if((lk<minim)||(lk>maxim)) {
    stop("Likelihood value outside of range [minimum maximum]")
  }
  u <- runif(n)
  mode <- (lk-minim)/(maxim-minim)
  s1 <- which(u<=mode)
  s2 <- which(u>mode)
  u[s1] <- sqrt(mode*u[s1])
  u[s2] <- 1-sqrt((1-mode)*(1-u[s2]))
  result <- minim+(maxim-minim)*u
  return(result)
}

composit <- function(x){
  (x-min(x))/(max(x)-min(x))
}
lvi.comp <- function(datcomp) {
  matcomposit <- apply(datcomp, 2, composit)
  lv.idx <- apply(matcomposit, 1, sum)/ ncol(datcomp)
  return(lvi.component = lv.idx)
}


rdrpl <- function(datradar,title) {
  maxim <- max(datradar$score)
  add.space <- 10^(floor(log10(maxim)))
  ggplot(data=datradar, aes(x=.data$dimension,y=.data$score))+
    geom_col(alpha=0.5, fill="blue") +
    coord_polar() +
    geom_text(aes(label = round(.data$score,2))) +
    scale_y_continuous(limits = c(-add.space,maxim+add.space)) +
    ggtitle(title) +
    theme_bw() +
    theme(axis.title.x=element_blank(),
          axis.text.x = element_text(hjust = 1, face = "bold",
                                     size=12, colour = "black"),
          axis.title.y=element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          panel.grid.major = element_line(color = "black", linewidth = 0.5),
          panel.border = element_blank(),
          plot.title=element_text(hjust=0.5, vjust = -2))
}
