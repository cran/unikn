## ----setup, include = FALSE---------------------------------------------------
options(max.print = "75")

knitr::opts_chunk$set(echo = TRUE,
                      cache = FALSE,
                      prompt = FALSE,
                      tidy = FALSE,
                      collapse = TRUE, 
                      comment = "#>",
                      message = FALSE,
                      warning = FALSE,
                      # Default figure options:
                      # fig.width = 6, 
                      # fig.asp = .80 # .618, # golden ratio
                      fig.align = "center",
                      out.width = "60%"
)

## ----load-pkg-colors, message = FALSE, warning = FALSE------------------------
# install.packages('unikn')  # install unikn from CRAN client
library('unikn')             # load the package

## ----show-add-pals, fig.width = 7.2, out.width = "550px", fig.asp = 2.0-------
seecol("add", main = "Color palettes from various institutions")

## ----def-col-mpg-example, fig.width = 5, fig.asp = 1, fig.align = 'center'----
seecol(pal = unikn::mpg_pal, col_brd = "black", lwd_brd = .5)

## ----def-col-rgb--------------------------------------------------------------
mpg_green <- grDevices::rgb( 17, 102,  86, maxColorValue = 255)
mpg_grey  <- grDevices::rgb(221, 222, 214, maxColorValue = 255)

## ----def-col-rgb-eval---------------------------------------------------------
mpg_green
mpg_grey

## ----def-col-hex--------------------------------------------------------------
mpg_green_2 <- "#116656"
mpg_grey_2  <- "#DDDED6"

## ----def-col-rgb-hex-eual-----------------------------------------------------
all.equal(mpg_green, mpg_green_2)
all.equal(mpg_grey,  mpg_grey_2)

## ----cols-to-pals-------------------------------------------------------------
c(mpg_green, mpg_grey)
data.frame(mpg_green, mpg_grey)

## ----newpal-mpg-3, fig.width = 5, fig.asp = 1, fig.align = 'center'-----------
mpg_pal_3 <- newpal(col = c(rgb( 17, 102,  86, maxColorValue = 255), "white", "#DDDED6"),
                    names = c("MPG green", "white", "MPG grey"),
                    as_df = FALSE)

## ----seecol-mpg-3, fig.width = 5, fig.asp = 1, fig.align = 'center'-----------
seecol(mpg_pal_3, 
       main = "My new color palette", col_brd = "black", lwd_brd = .5)

## ----newpal-mpg-5-------------------------------------------------------------
my_mpg_pal <- usecol(mpg_pal_3, n = 5)

## ----seecol-mpg-5, fig.width = 5, fig.asp = 1, fig.align = 'center'-----------
seecol(my_mpg_pal, main = "My new MPG color palette", 
       col_brd = "black", lwd_brd = .5)

## ----verify-equality----------------------------------------------------------
all.equal(col2rgb(mpg_pal), col2rgb(my_mpg_pal), check.attributes = FALSE)

## ----compare-custom-pals, eval = TRUE, fig.width = 5, fig.asp = .55, fig.align = 'center', collapse = TRUE----
# Re-define an existing color palette:
lmu_pal_rev <- newpal(col = lmu_pal_1[c(1, 3, 2)])

# Scaled version: 
seecol(list(lmu_pal_rev, uni_princeton_1, mpg_pal, pal_unikn), n = 7,
       pal_names = c("LMU Munich", "Princeton Uni", "Max Planck", "Uni Konstanz"),
       main = "Comparing scaled color palettes")

