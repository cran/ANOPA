## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE---------
cat("this is hidden; general initializations.\n")


## ----warning=FALSE, message=FALSE---------------------------------------------
options("ANOPA.feedback" = 'none')
library(ANOPA)
library(testthat)
nsim   <- 1000     # increase for more reliable simulations.
theN   <- 20       # number of simulated participants

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- s ~ grp         # the formula
#  BSDesign <- list(grp = c("ctrl","plcbo")) #one factor, two groups
#  thePs    <- c(0.3, 0.3)     # the true proportions, equal
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(41)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign )
#      w   <- anopa(frm, smp[,2:3] )
#      res <- c(res, if(summarize(w)[1,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design B,     testing B: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.early, s.middle, s.late) ~ .
#  WSDesign <- list(moment = c("early","middle","late"))
#  thePs    <- c(0.3, 0.3, 0.3)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(42)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, NULL, WSDesign )
#      w   <- anopa(frm, smp[,2:4] , WSFactors = "M(3)" )
#      res <- c(res, if(summarize(w)[1,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design W,     testing W: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- s ~ grp * eta
#  WSDesign <- list()
#  BSDesign <- list(eta = c("repue","ajun"), grp = c("early","middle","late"))
#  thePs    <- c(0.3, 0.3, 0.5, 0.5, 0.7, 0.7)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(41)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign )
#      w   <- anopa(frm, smp )
#      res <- c(res, if(summarize(w)[2,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design BxB,   testing B: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.repue.early, s.ajun.early,
#                    s.repue.middle, s.ajun.middle,
#                    s.repue.late, s.ajun.late) ~ .
#  BSDesign <- list()
#  WSDesign <- list(eta = c("repue","ajun"), moment = c("early","middle","late"))
#  thePs    <- c(0.3, 0.3, 0.5, 0.5, 0.7, 0.7)
#  # thePs    <- c(0.3, 0.7, 0.3, 0.7, 0.3, 0.7) # or no effect on factor 1
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(41)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, NULL, WSDesign )
#      w   <- anopa(frm, smp, WSFactors = c("e(2)", "m(3)") )
#      res <- c(res, if(summarize(w)[2,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design WxW,   testing W: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.early, s.middle, s.late) ~ grp
#  BSDesign <- list(grp = c("ctrl","plcbo"))
#  WSDesign <- list(moment = c("early","middle","late"))
#  thePs    <- c(0.3, 0.3, 0.5, 0.5, 0.7, 0.7)
#  # thePs    <- c(0.3, 0.7, 0.3, 0.7, 0.3, 0.7) # or no effect on factor 1
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(41)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign, WSDesign )
#      w   <- anopa(frm, smp[,2:5] , WSFactors = "M(3)")
#      res <- c(res, if(summarize(w)[2,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design WxB,   testing B: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- s ~ grp * eta * a
#  BSDesign <- list(eta = c("repue","ajun"),
#                   grp = c("early","middle","late"), a = c("1","2","3","4"))
#  thePs    <- rep(0.3, 24)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(41)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign )
#      w   <- anopa(frm, smp )
#      res <- c(res, if(summarize(w)[2,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design BxBxB, testing B: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.repue.early.1,  s.ajun.early.1,  s.repue.middle.1,
#              s.ajun.middle.1, s.repue.late.1,   s.ajun.late.1,   s.repue.early.2,
#              s.ajun.early.2,  s.repue.middle.2, s.ajun.middle.2, s.repue.late.2,
#              s.ajun.late.2,   s.repue.early.3,  s.ajun.early.3,  s.repue.middle.3,
#              s.ajun.middle.3, s.repue.late.3,   s.ajun.late.3,   s.repue.early.4,
#              s.ajun.early.4,  s.repue.middle.4, s.ajun.middle.4, s.repue.late.4,
#              s.ajun.late.4 ) ~ .
#  WSDesign <- list(eta = c("repue","ajun"), grp = c("early","middle","late"), a = c("1","2","3","4"))
#  thePs    <- rep(0.3, 24)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(43)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, NULL, WSDesign )
#      w   <- anopa(frm, smp, WSFactors = c("e(2)","g(3)", "a(4)") )
#      res <- c(res, if(summarize(w)[2,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design WxWxW, testing W: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.repue.early,  s.ajun.early,  s.repue.middle,
#  s.ajun.middle, s.repue.late,  s.ajun.late ) ~ a
#  BSDesign <- list( a = c("1","2","3","4") )
#  WSDesign <- list(eta = c("repue","ajun"), grp = c("early","middle","late") )
#  thePs    <- rep(0.3, 24)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(43)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign, WSDesign )
#      w   <- anopa(frm, smp, WSFactors = c("e(2)","g(3)") )
#      res <- c(res, if(summarize(w)[1,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design BxWxW, testing W: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## ----message=FALSE, warning=FALSE, echo=TRUE, eval=FALSE----------------------
#  frm      <- cbind(s.repue.early,  s.ajun.early,  s.repue.middle,
#  s.ajun.middle, s.repue.late,  s.ajun.late ) ~ a
#  BSDesign <- list( a = c("1","2","3","4") )
#  WSDesign <- list(eta = c("repue","ajun"), grp = c("early","middle","late") )
#  thePs    <- rep(0.3, 24)
#  
#  # test type-I error rate when no effect as is the case for factor 2
#  set.seed(42)
#  res <- c()
#  for (i in 1:nsim) {
#      smp <- GRP( thePs, theN, BSDesign, WSDesign )
#      w   <- anopa(frm, smp, WSFactors = c("e(2)","g(3)") )
#      res <- c(res, if(summarize(w)[3,4]<.05) 1 else 0)
#  }
#  typeI <- mean(res)
#  cat( "Design BxWxW, testing B: ", typeI, "\n")
#  
#  # tolerance is large as the number of simulations is small
#  expect_equal( typeI, .05, tolerance = 0.035)

## -----------------------------------------------------------------------------
options("ANOPA.feedback" = 'all')

