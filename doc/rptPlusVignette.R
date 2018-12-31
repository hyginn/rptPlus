## ----setup, include = FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# knitr knits in a new session with an empty global workspace after setting its
# working directory to ./vignettes. To make your package functions available in
# the vignette, you have to load the library. The following two lines should
# accomplish this without manual intervention:
pkgName <- trimws(gsub("^Package:", "", readLines("../DESCRIPTION")[1]))
library(pkgName, character.only = TRUE)


## ---- fig.show="hold", fig.cap="The golden spiral is shown in its enclosing golden rectangle."----
phi <- ((1 + sqrt(5)) / 2)^(1:-8)           # ten decreasing powers of phi
tStart <- -0.233
tEnd <- 8 * pi
N <- 800
theta <- seq(tStart, tEnd, length.out = N)
r = phi[1]^-(theta * (2  / pi))
x <- r * cos(theta)
y <- r * sin(theta)

x <- ((x + abs(min(x))) * phi[1]) / (max(x) - min(x))  # scale to [0, phi]
y <-  (y + abs(min(y)))           / (max(y) - min(y))  # scale to [0, 1]

oPar <- par(mar = rep(0.25, 4))             # set thin margins
plot(x, y,                                  # plot empty frame ...
     type = "n",
     xlim = c(0, phi[1]),
     ylim = c(0, 1),
     xlab = "", ylab = "", 
     axes = FALSE,
     asp = 1)                               # with fixed aspect ratio

rect(0, 0, phi[1], 1, border = "#CCCCCC")   # draw enclosing rectangle


C <- "#C9C9EE"                              # draw enclosed golden sections
segments(phi[1]-phi[2],            0,phi[1]-phi[2],       phi[2],col=C,lwd=0.4)
segments(            0,phi[2]-phi[3],phi[1]-phi[2],phi[2]-phi[3],col=C,lwd=0.4)
segments(phi[2]-phi[3],            0,phi[2]-phi[3],phi[2]-phi[3],col=C,lwd=0.4)
segments(phi[2]-phi[3],phi[3]-phi[4],phi[1]-phi[2],phi[3]-phi[4],col=C,lwd=0.4)
segments(phi[4]+phi[7],phi[3]-phi[4],phi[4]+phi[7],phi[2]-phi[3],col=C,lwd=0.4)
segments(phi[2]-phi[3],phi[5]+phi[8],phi[4]+phi[7],phi[5]+phi[8],col=C,lwd=0.4)
segments(phi[4]+phi[8],phi[3]-phi[4],phi[4]+phi[8],phi[5]+phi[8],col=C,lwd=0.4)
segments(phi[4]+phi[8],phi[5]+phi[9],phi[4]+phi[7],phi[5]+phi[9],col=C,lwd=0.4)

lines(x, y, col = "#CC0000")               # draw spiral

par <- oPar                                # reset graphics state


## ---- echo=TRUE, results='asis'--------------------------------------------
x <- matrix(paste0(names(rptGC), ": ", rptGC), ncol=4)
nuc <- c("A", "G", "C", "T")
colnames(x) <- paste0(nuc, "..", sep ="")
rownames(x) <- paste0(".", rep(nuc, each = 4), nuc, sep ="")

knitr::kable(x,
             caption = "The standard genetic code.",
             align = "c")

## ---- echo=TRUE, results='asis'--------------------------------------------
x <- readLines("../inst/extdata/test_lseq.dat")
knitr::kable(x, caption = "Five log-spaced numbers in [1, 10]")

## ---- echo=TRUE------------------------------------------------------------
sessionInfo()

