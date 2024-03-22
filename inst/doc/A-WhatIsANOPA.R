## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this will be hidden; use for general initializations.\n")
library(ANOPA)
library(ggplot2)
library(superb)

## ----message = FALSE, warning = FALSE-----------------------------------------
ArticleExample1

## -----------------------------------------------------------------------------
ArticleExample1$nSuccess / ArticleExample1$nParticipants

## -----------------------------------------------------------------------------
w <- anopa( {nSuccess; nParticipants} ~ DistractingTask, ArticleExample1)

## ----message=FALSE, warning=FALSE, fig.width=4, fig.height=3, fig.cap="**Figure 1**. The proportion of illumination as a function of the distracting task. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(w) 

## -----------------------------------------------------------------------------
summarize(w)

## -----------------------------------------------------------------------------
corrected(w)

## -----------------------------------------------------------------------------
# posthocProportions( w )  ## not yet bundled in the library

