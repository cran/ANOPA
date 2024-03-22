## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this is hidden; general initializations.\n")
library(ANOPA)
w1 <- anopa( {success;total} ~ Class * Difficulty, twoWayExample)
dataWide1     <- toWide(w1)
dataCompiled1 <-toCompiled(w1)
dataLong1     <- toLong(w1)
rownames(dataLong1) <- NULL

w2 <- anopa( cbind(bpre, bpost, b1week, b5week) ~ Status, minimalMxExample, WSFactors = "Moment(4)")
dataWide2     <- toWide(w2)
dataCompiled2 <-toCompiled(w2)
dataLong2     <- toLong(w2)
rownames(dataLong2) <- NULL

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
library(ANOPA)   

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
dataWide1

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
w1 <- anopa( success ~ Class * Difficulty, dataWide1)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
dataWide2

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
w2 <- anopa( cbind(bpre, bpost, b1week, b5week) ~ Status, dataWide2, WSFactors = "Moment(4)" )

## ----message=FALSE, warning=FALSE, echo=FALSE, eval=TRUE----------------------
head(dataLong1)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
w1Long <- anopa( Value ~ Class * Difficulty * Variable  | Id, dataLong1 )

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
head(dataLong2)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
w2Long <- anopa( Value ~ Status * Variable  | Id, dataLong2, WSFactors="Moment(4)" )

## ----message=FALSE, warning=FALSE, echo=FALSE, eval=TRUE----------------------
dataCompiled1

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
w1Compiled <- anopa( {success; Count} ~ Class * Difficulty, dataCompiled1 )

## ----message=FALSE, warning=FALSE, echo=FALSE, eval=TRUE----------------------
dataCompiled2

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=TRUE-----------------------
toCompiled(w1)
toCompiled(w2)

## -----------------------------------------------------------------------------
w1 <- anopa( {success;total} ~ Class * Difficulty, twoWayExample)
dataWide1     <- toWide(w1)
dataCompiled1 <-toCompiled(w1)
dataLong1     <- toLong(w1)

w2 <- anopa( cbind(bpre, bpost, b1week, b5week) ~ Status, minimalMxExample, WSFactors = "Moment(4)")
dataWide2     <- toWide(w2)
dataCompiled2 <-toCompiled(w2)
dataLong2     <- toLong(w2)

## ----message=TRUE, warning=FALSE, echo=TRUE, eval=TRUE------------------------
w3 <- anopa( cbind(r11,r12,r12,r21,r22,r23) ~ . , 
             twoWayWithinExample, 
             WSFactors = c("A(3)","B(2)") 
            )
toCompiled(w3)

## ----message=TRUE, warning=FALSE, echo=TRUE, eval=TRUE------------------------
options("ANOPA.feedback" = "none")

