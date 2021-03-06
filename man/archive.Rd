% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/archive.R
\name{archive}
\alias{archive}
\title{Archive Artifact to Local and GitHub Repository}
\usage{
archive(artifact, commitMessage = aoptions("commitMessage"),
  repo = aoptions("repo"), user = aoptions("user"),
  password = aoptions("password"), alink = aoptions("alink"),
  artifactName = deparse(substitute(artifact)), verbose = FALSE, ...)
}
\arguments{
\item{artifact}{An artifact to be archived on Local and Github \link{Repository}.}

\item{commitMessage}{A character denoting a message added to the commit while archiving \code{artifact} on GitHub Repository.
By default, an artifact's \link{md5hash} is added to the commit message when it is specified to \code{NULL}.}

\item{repo}{A character denoting GitHub repository name and synchronized local existing directory in which an artifact will be saved.}

\item{user}{A character denoting GitHub user name. Can be set globally with \code{aoptions("user", user)}.
See \link{agithub}.}

\item{password}{A character denoting GitHub user password. Can be set globally with \code{aoptions("password", password)}.
See \link{agithub}.}

\item{alink}{Logical. Whether the result should be put into \link{alink} function. If you would like to pass further arguments to \code{alink} then
you should specify them with \link{aoptions} in this case.}

\item{artifactName}{The name of the artifact with which it should be archived. If \code{NULL} then object's MD5 hash will be used instead.}

\item{verbose}{A logical value. If TRUE then additional messages will be printed out.}

\item{...}{Further arguments passed to \link{saveToLocalRepo} function.}
}
\description{
\code{archive} stores artifacts in the local \link{Repository} and automatically pushes archived
artifacts to the GitHub \code{Repository} with which the local \code{Repository} is synchronized
(via \link{createGitHubRepo} or \link{cloneGitHubRepo}). Function stores artifacts on the same
way as \link{saveToLocalRepo} function. 

This function is well explained on this \href{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github}{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github} blog post.
}
\details{
To learn more about  \code{Archivist Integration With GitHub} visit \link{agithub}.
}
\note{
Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
}
\examples{
\dontrun{

# empty GitHub Repository creation
authoriseGitHub(ClientID, ClientSecret) -> github_token
# authoriseGitHub also does: aoptions("github_token", github_token)
aoptions("user", user.name)
aoptions("password", user.password)

createGitHubRepo("archive-test4", default = TRUE)
## artifact's archiving
exampleVec <- 1:100

# archiving
archive(exampleVec) -> md5hash_path

## proof that artifact is really archived
showGithubRepo() # uses options from setGithubRepo
# let's remove exampleVec
rm(exampleVec)
# and load it back from md5hash_path
aread(md5hash_path)


# clone example
unlink("archive-test", recursive = TRUE)
cloneGithubRepo('https://github.com/MarcinKosinski/archive-test')
setRemoteRepo(aoptions("user"), "archive-test")
data(iris)
archive(iris)
showRemoteRepo()

## alink() option
vectorLong <- 1:100
vectorShort <- 1:20
# archiving
alink(archive(vectorLong))
archive(vectorShort, alink = TRUE)
showRemoteRepo()


}
}
\references{
More about \pkg{archivist.github} can be found on 
\href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
and about \pkg{archivist} in posts' history on \href{https://pbiecek.github.io/archivist/articles/posts.html}{https://pbiecek.github.io/archivist/articles/posts.html}
}
\seealso{
Other archivist.github: \code{\link{archivist.github-package}},
  \code{\link{authoriseGitHub}},
  \code{\link{cloneGitHubRepo}},
  \code{\link{createGitHubRepo}},
  \code{\link{deleteGitHubRepo}},
  \code{\link{pushGitHubRepo}}
}
\author{
Marcin Kosinski, \email{m.p.kosinski@gmail.com}
}
