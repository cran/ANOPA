## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this will be hidden; use for general initializations.\n")
library(ANOPA)

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=3, fig.cap="**Figure 1**. The proportions as a function of class and Difficulty. Error bars show difference-adjusted 95% confidence intervals."----
library(ANOPA)
w <- anopa( {success;total} ~ Class * Difficulty, twoWayExample)
anopaPlot(w) 

## ----message=FALSE, warning=FALSE, fig.width=4, fig.height=3,  fig.cap="**Figure 2**. The proportions as a function of Difficulty only. Error bars show difference-adjusted 95% confidence intervals."----
anopaPlot(w, ~ Difficulty ) 

## ----message=FALSE, warning=FALSE, fig.width=4, fig.height=3, fig.cap="**Figure 3**. Same as Figure 2 with some visual improvements."----
library(ggplot2)
anopaPlot(w, ~ Difficulty) + 
            theme_bw() +  # change theme
            scale_x_discrete(limits = c("Easy", "Moderate", "Difficult")) #change order

