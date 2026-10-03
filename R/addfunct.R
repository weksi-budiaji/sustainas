
create_anchors <- function(n_cols, min_val, max_val) {

  #anchor
  ol <- matrix(min_val,n_cols,n_cols)
  ol[upper.tri(ol)] <- max_val
  ba <- matrix(max_val,n_cols,n_cols)
  ba[upper.tri(ba)] <- min_val
  anchor <- rbind(ba,ol)
  n_an <- nrow(anchor)
  rownames(anchor) <- paste(rep('A',n_cols*2),1:(n_cols*2),sep='')

  #good bad up down
  gbup <- matrix(min_val,nrow = 4,ncol=n_cols)
  gbup[1,] <- max_val
  gbup[2,] <- min_val
  gbup[3,1:ceiling(n_cols/2)] <- max_val
  gbup[4,-c(1:ceiling(n_cols/2))] <- max_val
  rownames(gbup) <- c('GOOD','BAD','UP','DOWN')

  #final anchor
  anchors <- rbind(gbup, anchor)

  return(list(anchors = anchors, n_an = n_an))
}

transform_mds <- function(coords) {

  # Flip horizontal/vertical
  if (coords['GOOD', 1] < coords['BAD', 1]) {
    coords[, 1] <- -coords[, 1]
  }
  if (coords['UP', 2] < coords['DOWN', 2]) {
    coords[, 2] <- -coords[, 2]
  }

  # Rotation angle
  p1_theta <- atan(coords['GOOD', 2] / coords['GOOD', 1]) * (180 / pi)
  p2_theta <- atan(coords['BAD', 2] / coords['BAD', 1]) * (180 / pi)
  angle_rad <- -(mean(c(p1_theta, p2_theta))) * (pi / 180)

  # coordinates rotation
  x3 <- coords[, 1]
  y3 <- coords[, 2]
  x4 <- (x3 * cos(angle_rad)) - (y3 * sin(angle_rad))
  y4 <- (x3 * sin(angle_rad)) + (y3 * cos(angle_rad))
  coords1 <- matrix(c(x4, y4), ncol = 2)
  rownames(coords1) <- rownames(coords)

  # Scale to 0 - 100
  x_min <- min(coords1[, 1])
  x_max <- max(coords1[, 1])
  y_min <- min(coords1[, 2])
  y_max <- max(coords1[, 2])

  sc_x <- 100 / (x_max - x_min)
  X_scores <- coords1[, 1] * sc_x
  X_scores <- X_scores + abs(X_scores[2])

  sc_y <- 100 / (y_max - y_min)
  Y_scores <- coords1[, 2] * sc_y

  coords2 <- cbind(X_scores, Y_scores)

  return(coords2)
}

scale_data <- function(dat, n_col, col_indices, minim, maxim,
                       idminim, idmaxim, all = FALSE) {

  df_std <- dat

  if (all) {
    origin <- setdiff(1:n_col, col_indices)
    if(length(origin)!=0) stop("It standardize all column, make sure length of n_col and col_indices are equal")

    df_std <- apply(df_std, 2, function(x) {
      (x - min(x)) / (max(x) - min(x))
    })

  } else {
    origin <- setdiff(1:n_col, col_indices)
    for (idx in origin) {
      df_std[, idx] <- (dat[, idx] - minim) / (maxim - minim)
    }
    for (i in seq_along(col_indices)) {
      df_std[, col_indices[i]] <- (dat[, col_indices[i]] - idminim[i]) /
        (idmaxim[i] - idminim[i])
    }
  }
  return(df_std)
}

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
