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
               fig.align = "center",
	             out.width = "60%"
               )

## ----load-pkg-colors, message = FALSE, warning = FALSE------------------------
# install.packages('unikn')  # install unikn from CRAN client
library('unikn')             # load the package

## ----show-add-pals, fig.width = 7.5, out.width = "85%", fig.asp = .90---------
seecol("add", main = "Color palettes from various institutions")

## ----Cardiff, echo = FALSE, eval = FALSE, fig.align = 'center', fig.width = 5, fig.height = 3----
#  # Cardiff University, UK:
#  # ToDo.

## ----freiburg-cols, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# Source: http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben

# Basic colors: ---- 

uni_freiburg_br <- c("#004a99", "#c1002a")
names(uni_freiburg_br) <- c("uni-blau", "uni-rot")

uni_freiburg_bwr <- c("#004a99", "white", "#c1002a")  # add "white" for better gradients
names(uni_freiburg_bwr) <- c("uni-blau", "weiss", "uni-rot")

# Web colors: ----

uni_freiburg_blue <- c("#004a99", "#2a6ebb", "#6f9ad3")
names(uni_freiburg_blue) <- c("blue-1", "blue-2", "blue-3")

uni_freiburg_grey <- c("#f2f3f1", "#e0e1dd", "#d5d6d2", "#c9cac8", 
                       "#b2b4b3", "#9a9b9c", "#747678", "#363534")
names(uni_freiburg_grey) <- c("grey-0", "grey-1", "grey-2", "grey-3", 
                              "grey-5", "grey-7", "grey-9", "grey-font")

# Visualizations / illustrations: ----

uni_freiburg_info <- c("#2a6ebb", "#a7c1e3", "#7b2927", "#de3831", "#739600", "#92d400", 
                       "#4d4f53", "#747678", "#b2b4b3", "#d5d6d2", "#e98300", "#efbd47")
names(uni_freiburg_info) <- c("mid-blau", "hell-blau", "dark-red", "hell-red", "mid-green", "hell-green", 
                              "anthrazit", "dark-grey", "mid-grey", "hell-grey", "orange", "gelb")

## ----freiburg-newpal----------------------------------------------------------
uni_freiburg_info <- newpal(col = c("#2a6ebb", "#a7c1e3", "#7b2927", "#de3831", "#739600", "#92d400", 
                                    "#4d4f53", "#747678", "#b2b4b3", "#d5d6d2", "#e98300", "#efbd47"),
                            names = c("mid-blau", "hell-blau", "dark-red", "hell-red", "mid-green", "hell-green", 
                                      "anthrazit", "dark-grey", "mid-grey", "hell-grey", "orange", "gelb")
                            )

## ----freiburg-seecol, fig.width = 5, fig.asp = .80, fig.align = 'center', collapse = TRUE----
# View color palette:
seecol(uni_freiburg_info, main = "Colors of the University of Freiburg")
# seecol(uni_freiburg_bwr, n = 7)  # extend color palette
# seecol(c(uni_freiburg_blue, "white", uni_freiburg_grey))  # mix color palette

# use in a demo plot:
demopal(uni_freiburg_info,
        type = 4, col_par = NA, seed = 79098, 
        main = "Colors of the University of Freiburg")

## ----princeton-1, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# 3 shades of orange: 
orange_basic <- "#E87722"  # Pantone 158 C
orange_white <- "#E77500"  # orange on white background
orange_black <- "#F58025"  # orange on black background

# Defining color palettes:
uni_princeton <- c(orange_basic, "black")
names(uni_princeton) <- c("orange", "black")

# Define color palette and names (in 2 steps):
uni_princeton_1 <- c(orange_white, "white", "black")
names(uni_princeton_1) <- c("orange_w", "white", "black")

## ----princeton-2, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# Basic colors:
uni_princeton_0 <- newpal(col = c(orange_basic, "black"),
                          names = c("orange", "black"))

# 1st color palette (on white backgrounds):
uni_princeton_1 <- newpal(col = c(orange_white, "white", "black"),
                          names = c("orange_w", "white", "black"))
                          
# 2nd color palette (on black backgrounds):
uni_princeton_2 <- newpal(col = c(orange_black, "black", "white"), 
                          names = c("orange_b", "black", "white"))

## ----princeton-3, fig.width = 5, fig.asp = .80, fig.align = 'center', fig.show = "hold", collapse = TRUE----
seecol(uni_princeton_1, col_bg = "grey90", 
       main = "Colors of Princeton University")

## ----mpg-rgb-cols, echo = FALSE, eval = FALSE, fig.width = 6, fig.asp = .618, fig.align = 'center', collapse = TRUE----
#  # Using RGB values:
#  mpg_pal <- data.frame(# named colors:
#    "mpg_green" = rgb( 17, 102,  86, maxColorValue = 255),
#    "mpg_gray"  = rgb(221, 222, 214, maxColorValue = 255),
#    "mpg_grey"  = rgb(208, 211, 212, maxColorValue = 255)
#    )
#  seecol(pal = list(mpg_pal))  # Ooops...

## ----mpg-hex-cols, echo = FALSE, eval = FALSE---------------------------------
#  # Using HEX values:
#  mpg_green <- "#007367"
#  mpg_grey  <- "#D0D3D4"
#  
#  # col2rgb(mpg_green)
#  # col2rgb(mpg_grey)
#  
#  mpg_pal <- usecol(pal = c(mpg_green, "white", mpg_grey))
#  # seecol(mpg_pal)

## ----mpg-newpal---------------------------------------------------------------
# Main colors (using HEX values):
mpg_green <- "#007367"
mpg_grey  <- "#D0D3D4"

# Create new color palette (as a vector):
mpg_pal <- newpal(col = c(mpg_green, "white", mpg_grey), 
                  names = c("mpg green", "white", "mpg grey")
                  )

## ----mpg-seecol, fig.width = 5, fig.asp = .80, fig.align = 'center', collapse = TRUE----
seecol(mpg_pal,
       col_brd = "black", lwd_brd = 1, 
       main = "Colors of the Max Planck Society")

## ----compare-custom-pals, eval = TRUE, fig.width = 5, fig.asp = .50, fig.align = 'center', collapse = TRUE----
# Compare and extend custom color palettes:
# seecol(list(uni_freiburg_info, uni_freiburg_bwr, mpg_pal, uni_princeton_1))

# Scaled version: 
seecol(list(uni_freiburg_bwr, uni_princeton_1, mpg_pal, pal_unikn), n = 9,
       pal_names = c("Uni Freiburg", "Princeton Uni", "Max Planck", "Uni Konstanz"),
       main = "Comparing scaled color palettes")

