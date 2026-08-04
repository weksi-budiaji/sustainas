#' Livelihood vulnerability index
#'
#' @description This function calculates Livelihood vulnerability index
#'
#' @param datlvi An input of data set (\emph{see} \strong{Details}).
#' @param sub.id An column id for each component (\emph{see} \strong{Details}).
#' @param dim.name Components' name (\emph{see} \strong{Details}).
#'
#' @details The data set is a data frame. The columns in \code{datlvi}
#' indicate variables where the rows are the districts/ objects.
#' \code{sub.id} indicates the column id of the first variable for
#' each sub-component.
#'
#' @return Function returns a list of livelihood vulnerability indices.
#'
#' @author Weksi Budiaji \cr Contact: \email{budiaji@untirta.ac.id}
#'
#'
#' @references Micah B. Hahn, Anne M. Riederer, Stanley O. Foster. 2009.
#' The Livelihood Vulnerability Index: A pragmatic approach to assessing
#' risks from climate variability and change—A case study in Mozambique.
#' Global Environmental Change, Volume 19, Issue 1, Pages 74-88.
#' doi:http://doi.org/10.1016/j.gloenvcha.2008.11.002
#'
#' @examples
#' #data simulation
#' data("social")
#' lvi(social,sub.id = c(1),dim.name = c("Social"))
#' lvi(three, sub.id = c(1,9,16),dim.name = c("Social","Institution","Technology"))
#'
#' @export

lvi <- function(datlvi, sub.id = c(1,3,5,7,9),
                dim.name = c('human','natur','physic','financial','social')){

  if(length(sub.id)!=length(dim.name)) stop("sub.id and dim.name must have an equal length!")

  n.comp <- length(sub.id)
  reslist <- lvires <- vector("list",n.comp)
  n.att <- numeric(n.comp)
  idx <- c(sub.id,ncol(datlvi)+1)
  for (i in 1:n.comp){
    reslist[[i]] <- datlvi[,c(idx[i]:(idx[i+1]-1))]
    n.att[i] <- ncol(reslist[[i]])
    lvires[[i]] <- lvi.comp(reslist[[i]])
  }
  matori <- matrix(unlist(lvires),ncol=n.comp)
  matmultp <- matori*n.att
  rownames(matmultp) <- rownames(matori) <- rownames(datlvi)
  colnames(matmultp) <- colnames(matori) <- dim.name
  lvifin <- apply(matmultp, 1, sum)/sum(n.att)
  return(list(vulnerability.index = lvifin, dimension.score = matori,
              dimension.weight = matmultp))
}
