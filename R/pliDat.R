#' Lodgepole pine mortality data
#'
#' @docType data
#'
#' @usage data(pliDat)
#'
#'@format A data frame with 92 rows and 15 variables:
#' \describe{
#'   \item{Plot}{Plot # within opening, always two trees per plot}
#'   \item{Tree #}{Tree #1 is always the dead tree, Tree #2 is live}
#'   \item{Distance to live partner}{Distance between trees in plot, m}
#'   \item{Crown class}{Dominant or codominant trees were sampled}
#'   \item{Crown volume}{This compares volume between live and dead trees within a plot.}
#'   \item{Longest branch}{Ocular estimate of longest branch within crown, cm}
#'   \item{B}{Height to bottom of crown (in case of dead trees, where live crown was),m}
#'   \item{Percentage of live needles}{Percentage of live needles to dead needles in crown}
#'   }
#' @keywords datasets
"pliDat"