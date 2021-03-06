% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clique_selection.R
\name{.prune_clique}
\alias{.prune_clique}
\title{Prune the list of cliques}
\usage{
.prune_clique(adj, clique_list, target_idx, threshold = 0.9)
}
\arguments{
\item{adj}{0-1 symmetrical matrix}

\item{clique_list}{list of vectors}

\item{target_idx}{vector}

\item{threshold}{target density of quasi-clique}
}
\value{
list of vectors
}
\description{
Prune the list of cliques
}
