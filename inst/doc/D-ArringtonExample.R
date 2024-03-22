## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this is hidden; general initializations.\n")
library(ANOPA)


## -----------------------------------------------------------------------------
ArringtonEtAl2002

## -----------------------------------------------------------------------------
getOption("ANOPA.zeros")

## -----------------------------------------------------------------------------
w <- anopa( {s; n} ~  Location * Diel * Trophism, ArringtonEtAl2002)

## -----------------------------------------------------------------------------
uncorrected(w)

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=5, fig.cap="**Figure 1**. The proportions in the Arrington et al. 2002 data. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(w)

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=3, fig.cap="**Figure 1**. The proportions as a function of class and Difficulty. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(w, ~ Trophism * Location)

## -----------------------------------------------------------------------------
e <- emProportions( w, ~ Location * Trophism | Diel  ) 

