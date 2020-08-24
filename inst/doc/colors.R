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
               # fig.width = 7.2, 
               # fig.asp = .618, # golden ratio
               # out.width = "75%",
               fig.align = "center"
               )

## ----load-pkg-colors, message = FALSE, warning = FALSE------------------------
# install.packages('unikn')  # install unikn from CRAN client
library('unikn')             # loads the package

## ----seecol-unikn-all, fig.width = 7, fig.height = 6, fig.align = 'center'----
seecol("unikn_all")  # same as seecol("all")

## ----seecol-unikn-basic-2, fig.width = 7, fig.height = 2.5, fig.align = 'center'----
seecol("unikn_basic")

## ----seecol-pair-all, fig.width = 7, fig.height = 2.5, fig.align = 'center'----
seecol("pair_all")

## ----seecol-pref-all, fig.width = 7, fig.height = 4, fig.align = 'center'-----
seecol("pref_all")

## ----seecol-grad-all-2, fig.width = 7, fig.height = 3.5, fig.align = 'center'----
seecol("grad_all")

## ----unikn-palette, fig.width = 6, fig.asp = .75, fig.align = 'center'--------
seecol(pal_unikn)  # view details of pal_unikn 

## ----save-seecol, fig.width = 6, fig.asp = .75, fig.align = 'center'----------
my_pal <- seecol(pal_unikn_light)  # view details of AND save pal_unikn_light to my_pal  

## ----my-pal-example, fig.width = 6, fig.asp = .618, fig.align = 'center'------
barplot(1/sqrt(1:10), col = my_pal)  # use my_pal in a plot

## ----invisible-seecol, fig.width = 6, fig.asp = .75, fig.align = 'center'-----
seecol(pal_bordeaux)

## ----seecol-aesthetic-parameters, fig.width = 6, fig.asp = .75, fig.align = 'center'----
seecol("grad_all", col_brd = "black", lwd_brd = 2, title = "Color gradients with black borders")
seecol(pal_seegruen, col_brd = "white", lwd_brd = 10, title = "A color palette with white borders")

## ----usecol-default-use, fig.width = 6, fig.asp = .618, fig.align = 'center'----
# Using a color palette:
barplot(1/sqrt(1:11), col = usecol(pal_unikn))

## ----free-pal-args, fig.width = 6, fig.asp = .75, eval = FALSE----------------
#  seecol(pal_seegruen)
#  seecol("pal_seegruen")
#  seecol("seegruen")
#  seecol(seegruen)  # issues a warning, but works

## ----use-subset, fig.width = 6, fig.height = 5, fig.align = 'center', collapse = TRUE----
seecol("unikn_all", n = 4)
seecol(pal_unikn, 4)

## ----use-col-small-n, fig.width = 3.5, fig.height = 3, fig.align = 'center', collapse = TRUE, fig.show='hold'----
barplot(1/sqrt(1:2), col = usecol(pal_seeblau, n = 2))
barplot(1/sqrt(1:3), col = usecol(pal_seeblau, n = 3))

## ----use-superset-all, fig.width = 7, fig.height = 6, fig.align = 'center', collapse = TRUE----
seecol("all", n = 12)

## ----use-superset, fig.width = 6, fig.asp = .75, fig.align = 'center', collapse = TRUE----
seecol(pal_seeblau, 12)

## ----use-col-big-n, fig.width = 6, fig.asp = .618, fig.align = 'center'-------
barplot(1/sqrt(1:11), col = usecol(pal_bordeaux, n = 11))

## ----combine-pals, fig.width = 6, fig.asp = .75, fig.align = 'center'---------
seecol(pal = c(rev(pal_petrol), "white", pal_bordeaux))

## ----combine-pals-n, fig.width = 6, fig.asp = .75, fig.align = 'center'-------
seecol(pal = usecol(c(Karpfenblau, Seeblau, "gold"), n = 10))
# Note, that redundant use of seecol and usecol shows HEX values as names.
# seecol(pal = c(Karpfenblau, Seeblau, "gold"), n = 10)  # would work, but show no intermediate names

## ----use-my-pair, fig.width = 6, fig.height = 4, fig.align = 'center'---------
my_pair <- seecol(pal_unikn_pair, n = 10)

# Create data: 
dat <- matrix(sample(5:10, size = 10, replace = TRUE), ncol = 5)

# Plot in my_pair colors:
barplot(dat, beside = TRUE, col = my_pair)

## ----transparency1-pal, fig.width = 6, fig.asp = .75, fig.align = 'center', collapse = TRUE----
seecol(pal_unikn, alpha = 0.5)

## ----transparency-all, fig.width = 6, fig.height = 3, fig.align = 'center'----
seecol("grad", alpha = 0.67)

## ----compare-custom-palettes, fig.width = 6, fig.height = 3, fig.align = 'center'----
# Define 2 palettes: 
pal1 <- c(rev(pal_seeblau), "white", pal_bordeaux)
pal2 <- usecol(c(Karpfenblau, Seeblau, "gold"), n = 10)

# Show the my_pair palette from above, the 2 palettes just defined, and 2 pre-defined palettes:  
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair))

## ----set-custom-palette-names, fig.width = 6, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), 
       pal_names = c("my_pair", "blue_bord", "blue_yell"),
       title = "Labeling custom color palettes")

## ----set-all-palette-names, fig.width = 6, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), 
       pal_names = c("my_pair", "blue_bord", "blue_yell", "blue_black", "mix_pair"),
       title = "Comparing and labeling custom color palettes")

## ----subset-compare, fig.width = 6, fig.height = 3, fig.align = 'center'------
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), n = 5)

## ----superset-compare, fig.width = 6, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), n = 15)

## ----demo-scatterplot, eval = TRUE, fig.width = 5, fig.height = 5, fig.align = 'center', collapse = TRUE----
plot(x = runif(99), y = runif(99), "p", pch = 16, cex = 4, 
     col = usecol(pal_unikn, alpha = .50),  # with transparency
     main = "99 transparent dots", axes = FALSE, xlab = NA, ylab = NA)

## ----use-pal-ggplot2, eval = FALSE, fig.width = 7, fig.asp = .618, fig.align = 'center', collapse = TRUE----
#  # Example based on https://www.r-graph-gallery.com/137-spring-shapes-data-art/
#  
#  # (1) Create data: ----
#  ngroup <- 50
#  names <- paste("G_", seq(1, ngroup), sep = "")
#  df <- data.frame()
#  
#  set.seed(3)
#  for(i in seq(1:30)){
#      data = data.frame(matrix(0, ngroup, 3))
#      data[, 1] = i
#      data[, 2] = sample(names, nrow(data))
#      data[, 3] = prop.table(sample( c(rep(0, 100), c(1:ngroup)), nrow(data)))
#      df = rbind(df, data)}
#  colnames(df) <- c("X","group","Y")
#  df <- df[order(df$X, df$group) , ]
#  
#  # (1) Choose colors: ----
#  
#  # (a) using RColorBrewer:
#  # library(RColorBrewer)
#  # cur_col <- brewer.pal(11, "Paired")
#  # cur_col <- colorRampPalette(cur_col)(ngroup)
#  # cur_col <- cur_col[sample(c(1:length(cur_col)), size = length(cur_col))]  # randomize
#  
#  # (b) using unikn:
#  library(unikn)
#  cur_col <- usecol(pal = pal_unikn, n = ngroup)
#  # cur_col <- cur_col[sample(c(1:length(cur_col)), size = length(cur_col))]  # randomize
#  
#  # (3) Use ggplot2: ----
#  
#  library(ggplot2)
#  
#  ggplot(df, aes(x = X, y = Y, fill = group)) +
#    geom_area(alpha = 1, color = Grau, size = .01 ) +
#    scale_fill_manual(values = cur_col) +
#    theme_void() +
#    theme(legend.position = "none")

## ----Cardiff, echo = FALSE, eval = FALSE, fig.align = 'center', fig.width = 5, fig.height = 3----
#  # Cardiff University, UK:
#  # ToDo.

## ----freiburg-cols, fig.width = 7, fig.asp = .618, fig.align = 'center', fig.show = "hold", collapse = TRUE----
# Basic colors: https://www.zuv.uni-freiburg.de/service/cd/cd-manual/farbwelt

pal_freiburg_bluered <- c("#004a99", "#c1002a")
names(pal_freiburg_bluered) <- c("uni-blau", "uni-rot")

pal_freiburg_basic <- c("#004a99", "white", "#c1002a")  # add "white" for better gradients
names(pal_freiburg_basic) <- c("uni-blau", "weiss", "uni-rot")

# Web colors: https://www.zuv.uni-freiburg.de/service/wsg/webstyleguide/farben  

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

## ----freiburg-seecol, fig.width = 7, fig.asp = .618, fig.align = 'center', collapse = TRUE----
seecol(pal_freiburg_info)            # view color palette
# seecol(pal_freiburg_basic, n = 7)  # extend color palette
# seecol(c(pal_freiburg_blue, "white", pal_freiburg_grey))  # mix color palette

## ----princeton-cols, fig.width = 6, fig.asp = .69, fig.align = 'center', fig.show = "hold", collapse = TRUE----
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
       col_bg = "grey90", title = "Color palette of Princeton University")

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

## ----mpg-pal-def, fig.width = 6, fig.asp = .618, fig.align = 'center', collapse = TRUE----
pal_mpg <- c("#007367", "white", "#D0D3D4")
names(pal_mpg) <- c("mpg green", "white", "mpg grey")

## ----mpg-seecol, fig.width = 6, fig.asp = .69, fig.align = 'center', collapse = TRUE----
seecol(pal_mpg, 
       col_brd = "black", lwd_brd = 2, 
       title = "Colors of the Max Planck Society")

## ----compare-custom-pals, eval = TRUE, fig.width = 6, fig.asp = .50, fig.align = 'center', collapse = TRUE----
# Compare and extend custom color palettes:
# seecol(list(pal_freiburg_info, pal_freiburg_basic, pal_mpg, pal_princeton_1))

# Scaled version: 
seecol(list(pal_freiburg_basic, pal_princeton_1, pal_mpg, pal_unikn), n = 9,
       pal_names = c("Uni Freiburg", "Princeton Uni", "Max Planck", "Uni Konstanz"),
       title = "Comparing scaled color palettes")

