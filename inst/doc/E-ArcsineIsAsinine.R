## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this will be hidden; use for general initializations.\n")
library(ANOPA)
library(ggplot2)

## -----------------------------------------------------------------------------
warton <- data.frame(
  grp = c(1,2),
  s   = c(3,1),
  n   = c(3,3)  
)

## -----------------------------------------------------------------------------
w <- anopa( {s;n}~grp, warton)
summary( w )

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=3, fig.cap="**Figure 1**. The proportions for two groups. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(w)

## -----------------------------------------------------------------------------
laurencelle <- data.frame(
  grp = c(1,2),
  s   = c(3,0),
  n   = c(3,3)  
)

## -----------------------------------------------------------------------------
l <- anopa( {s;n}~grp, laurencelle)
summary(l)

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=3, fig.cap="**Figure 2**. The proportions for two extremely different groups. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(l)

