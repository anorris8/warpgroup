% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/xcmsWarpgroup.R
\name{group.warpgroup}
\alias{group.warpgroup}
\title{A wrapper for supplying xcmsSet objects to Warpgroup.}
\usage{
group.warpgroup(xs, xr.l, rt.max.drift, ppm.max.drift, rt.aligned.lim, smooth.n,
  normalize = T, eic.resample.target = Inf, output.groups = F,
  sc.aligned.factor = 1, detailed.groupinfo = F, min.peaks = 1,
  pct.pad = 0.1)
}
\arguments{
\item{xs}{An xcmsSet object with initial grouping information.}

\item{xr.l}{A list contanining xcmsRaw objects for each sample in the xcmsSet object in order.}

\item{rt.max.drift}{Float.  The maximum retention time drift in seconds expected for a peak in the data set in scans.  Used when setting the boundaries for looking for missing peaks.}

\item{ppm.max.drift}{Integer. The maximum mass drift expected for a peak in the data set in ppm.  Used when setting the boundaries for looking for missing peaks.}

\item{rt.aligned.lim}{Float. Peak bounds after alignment are considered to describe the same region if they are within this limit.}

\item{smooth.n}{Number of points to consider for the moving average smoothing of each EIC. 1 disables smoothing. See \code{\link{eicMatFromList}}}

\item{normalize}{Boolean.  If TRUE all EICs will be normalized to 1. See \code{\link{eicMatFromList}}}

\item{eic.resample.target}{If less than one the resulting EICs will be of length max*length.target.  If greater than 1 resulting EICs will be of length length.target.  If Inf resulting EICs will be of length max. See \code{\link{eicMatFromList}}}

\item{output.groups}{Boolean. If \code{TRUE} the output is a list of warpgroup outputs for every group rather than an xcmsSet.  Allows for better integration parameter selection with \code{\link{warpgroupsToXs}}.}

\item{sc.aligned.factor}{Float. Experimental feature where graph edges are weighted proportionally to the distance be   tween the aligned peak bounds. Higher numbers emphasize closer peak bounds.}

\item{detailed.groupinfo}{Boolean. Returns several extra descriptors of the warping and graph clustering.}

\item{min.peaks}{Integer. Groups with fewer peaks than \code{min.peaks} are skipped.}
}
\value{
An xcmsSet with groups and peaks replaced by warpgroup generated ones.
}
\description{
\code{group.warpgroup} returns an xcmsSet with the original groups and peaks replaced by those returned by the \code{\link{warpgroup}} algorithm.
}
\details{
This function simply iterates over each group in the xcmsSet and runs \code{\link{warpgroup}} on them. The resulting warpgroup output is then re-integrated and returned as a new xcmsSet.
The resulting xcmsSet is ready for a call to \code{\link{diffreport}} and does not need to be grouped.  The results will be redundant and should be filtered appropriately.
}
\seealso{
See \url{https://github.com/nathaniel-mahieu/warpgroup} for examples.
}

