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
               ## Default figure options:
               # fig.width = 6, 
               # fig.asp = .8 # .618, # golden ratio
               # out.width = "75%",
               fig.align = "center"
               )

## ----load-pkg-colors, message = FALSE, warning = FALSE------------------------
# install.packages('unikn')  # install unikn from CRAN client
library('unikn')             # loads the package

## ----Cardiff, echo = FALSE, eval = FALSE, fig.align = 'center', fig.width = 5, fig.height = 3----
#  # Cardiff University, UK:
#  # ToDo.

## ----freiburg-cols, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# Source: http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben

# Basic colors: ---- 
pal_freiburg_bluered <- c("#004a99", "#c1002a")
names(pal_freiburg_bluered) <- c("uni-blau", "uni-rot")

pal_freiburg_basic <- c("#004a99", "white", "#c1002a")  # add "white" for better gradients
names(pal_freiburg_basic) <- c("uni-blau", "weiss", "uni-rot")

# Web colors: ----
pal_freiburg_blue <- c("#004a99", "#2a6ebb", "#6f9ad3")
names(pal_freiburg_blue) <- c("blue-1", "blue-2", "blue-3")

pal_freiburg_grey <- c("#f2f3f1", "#e0e1dd", "#d5d6d2", "#c9cac8", 
                       "#b2b4b3", "#9a9b9c", "#747678", "#363534")
names(pal_freiburg_grey) <- c("grey-0", "grey-1", "grey-2", "grey-3", 
                              "grey-5", "grey-7", "grey-9", "grey-font")

pal_freiburg_info <- c("#2a6ebb", "#a7c1e3", "#7b2927", "#de3831", "#739600", "#92d400", 
                       "#4d4f53", "#747678", "#b2b4b3", "#d5d6d2", "#e98300", "#efbd47")
names(pal_freiburg_info) <- c("mid-blau", "hell-blau", "dark-red", "hell-red", "mid-green", "hell-green", 
                              "anthrazit", "dark-grey", "mid-grey", "hell-grey", "orange", "gelb")

## ----freiburg-newpal----------------------------------------------------------
pal_freiburg_info <- newpal(col = c("#2a6ebb", "#a7c1e3", "#7b2927", "#de3831", "#739600", "#92d400", 
                                    "#4d4f53", "#747678", "#b2b4b3", "#d5d6d2", "#e98300", "#efbd47"),
                            names = c("mid-blau", "hell-blau", "dark-red", "hell-red", "mid-green", "hell-green", 
                                      "anthrazit", "dark-grey", "mid-grey", "hell-grey", "orange", "gelb")
                            )

## ----freiburg-seecol, fig.width = 5, fig.asp = .80, fig.align = 'center', collapse = TRUE----
seecol(pal_freiburg_info)            # view color palette
# seecol(pal_freiburg_basic, n = 7)  # extend color palette
# seecol(c(pal_freiburg_blue, "white", pal_freiburg_grey))  # mix color palette

## ----princeton-cols, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# HEX values for 3 shades of orange: 
orange_basic <- "#E87722"  # Pantone 158 C
orange_white <- "#E77500"  # orange on white
orange_black <- "#F58025"  # orange on black

# Defining color palettes:
pal_princeton <- c(orange_basic, "black")
names(pal_princeton) <- c("orange", "black")

# Define color palette and names (in 2 steps):
pal_princeton_1 <- c(orange_white, "white", "black")
names(pal_princeton_1) <- c("orange_w", "white", "black")

# Define both colors and names (in 1 step) by using the `newpal()` function:
pal_princeton_1 <- newpal(col = c("#E77500", "white", "black"),
                          names = c("orange_w", "white", "black"))
                          
# Define 2nd color palette:
pal_princeton_2 <- newpal(col = c(orange_black, "black", "white"), 
                          names = c("orange_b", "black", "white"))

# View color palette (with custom background color and title):
seecol(pal_princeton_1,  # view color palette
       col_bg = "grey90", main = "Color palette of Princeton University")

## ----mpg-rgb-cols, echo = FALSE, eval = FALSE, fig.width = 6, fig.asp = .618, fig.align = 'center', collapse = TRUE----
#  # Using RGB values:
#  pal_mpg <- data.frame(# named colors:
#    "mpg_green" = rgb( 17, 102,  86, maxColorValue = 255),
#    "mpg_gray"  = rgb(221, 222, 214, maxColorValue = 255),
#    "mpg_grey"  = rgb(208, 211, 212, maxColorValue = 255)
#    )
#  seecol(pal = list(pal_mpg))  # Ooops...

## ----mpg-hex-cols, echo = FALSE, eval = FALSE, out.width = "67%", fig.asp = .75, fig.align = 'center', collapse = TRUE----
#  # Using HEX values:
#  mpg_green <- "#007367"
#  mpg_grey  <- "#D0D3D4"
#  
#  # col2rgb(mpg_green)
#  # col2rgb(mpg_grey)
#  
#  pal_mpg <- usecol(pal = c(mpg_green, "white", mpg_grey))
#  # seecol(pal_mpg)

## ----mpg-pal-def-vector, echo = FALSE, eval = FALSE, fig.width = 5, fig.asp = .8, fig.align = 'center', collapse = TRUE----
#  pal_mpg <- c("#007367", "white", "#D0D3D4")
#  names(pal_mpg) <- c("mpg green", "white", "mpg grey")
#  # seecol(pal_mpg)

## ----mpg-pal-def-df, fig.width = 5, fig.asp = .80, fig.align = 'center', collapse = TRUE----
# Define vectors:
col_mpg <- c("#007367", "white", "#D0D3D4")     # color definition 
col_lbl <- c("mpg green", "white", "mpg grey")  # color names

# Create new color palette (as a vector):
pal_mpg <- newpal(col = col_mpg, names = col_lbl)

## ----mpg-seecol, fig.width = 5, fig.asp = .80, fig.align = 'center', collapse = TRUE----
seecol(pal_mpg,
       col_brd = "black", lwd_brd = 1, 
       main = "Colors of the Max Planck Society")

## ----compare-custom-pals, eval = TRUE, fig.width = 5, fig.asp = .50, fig.align = 'center', collapse = TRUE----
# Compare and extend custom color palettes:
# seecol(list(pal_freiburg_info, pal_freiburg_basic, pal_mpg, pal_princeton_1))

# Scaled version: 
seecol(list(pal_freiburg_basic, pal_princeton_1, pal_mpg, pal_unikn), n = 9,
       pal_names = c("Uni Freiburg", "Princeton Uni", "Max Planck", "Uni Konstanz"),
       main = "Comparing scaled color palettes")

