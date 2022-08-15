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

## ----unikn-palette, fig.width = 5, fig.asp = .8, fig.align = 'center'---------
seecol(pal_unikn)  # view details of pal_unikn 

## ----save-seecol, fig.width = 5, fig.asp = .8, fig.align = 'center'-----------
my_pal <- seecol(pal_unikn_light)  # view details of AND save a color palette  

## ----my-pal-example, fig.width = 5, fig.asp = .65, fig.align = 'center'-------
barplot(1/sqrt(1:10), col = my_pal)  # use my_pal in a plot

## ----invisible-seecol, fig.width = 5, fig.asp = .8, fig.align = 'center'------
seecol(pal_bordeaux)

## ----seecol-unikn-all, fig.width = 6, fig.height = 5, fig.align = 'center'----
seecol("unikn_all")  # same as seecol("all")

## ----seecol-unikn-basic-2, fig.width = 6, fig.height = 2, fig.align = 'center'----
seecol("unikn_basic")

## ----seecol-pair-all, fig.width = 6, fig.height = 2.5, fig.align = 'center'----
seecol("pair_all")

## ----seecol-pref-all, fig.width = 6, fig.height = 3.5, fig.align = 'center'----
seecol("pref_all")

## ----seecol-grad-all-2, fig.width = 5, fig.asp = .8, fig.align = 'center'-----
seecol("grad_all")

## ----seecol-aesthetic-parameters, fig.width = 5, fig.asp = .8, fig.align = 'center'----
seecol("grad_all", col_brd = "black", lwd_brd = 1, title = "Color gradients (with black borders)")
seecol(pal_seegruen, col_brd = "white", lwd_brd = 10, title = "A color palette (with white borders)")

## ----usecol-default-use, fig.width = 5, fig.asp = .65, fig.align = 'center'----
# Using a color palette:
barplot(1/sqrt(1:11), col = usecol(pal_unikn))

## ----free-pal-args, fig.width = 5, fig.asp = .75, eval = FALSE----------------
#  seecol(pal_seegruen)
#  seecol("pal_seegruen")
#  seecol("seegruen")
#  seecol(seegruen)  # issues a warning, but works

## ----use-subset, fig.width = 5, fig.height = 4, fig.align = 'center', collapse = TRUE----
seecol("unikn_all", n = 4)
seecol(pal_unikn, 4)

## ----use-col-small-n, fig.width = 3, fig.height = 2.5, fig.align = 'center', collapse = TRUE, fig.show='hold'----
barplot(1/sqrt(1:2), col = usecol(pal_seeblau, n = 2))
barplot(1/sqrt(1:3), col = usecol(pal_seeblau, n = 3))

## ----use-superset-all, fig.width = 5, fig.asp = .8, fig.align = 'center', collapse = TRUE----
seecol("all", n = 12)

## ----use-superset, fig.width = 5, fig.asp = .8, fig.align = 'center', collapse = TRUE----
seecol(pal_seeblau, 12)

## ----use-col-big-n, fig.width = 5, fig.asp = .65, fig.align = 'center'--------
barplot(1/sqrt(1:11), col = usecol(pal_bordeaux, n = 11))

## ----combine-pals, fig.width = 5, fig.asp = .8, fig.align = 'center'----------
seecol(pal = c(rev(pal_petrol), "white", pal_bordeaux))

## ----combine-pals-n, fig.width = 5, fig.asp = .8, fig.align = 'center'--------
seecol(pal = usecol(c(Karpfenblau, Seeblau, "gold"), n = 10))
# Note, that redundant use of seecol and usecol shows HEX values as names.
# seecol(pal = c(Karpfenblau, Seeblau, "gold"), n = 10)  # would work, but show no intermediate names

## ----use-my-pair, fig.width = 5, fig.height = 4, fig.align = 'center'---------
my_pair <- seecol(pal_unikn_pair, n = 10)

# Create data: 
dat <- matrix(sample(5:10, size = 10, replace = TRUE), ncol = 5)

# Plot in my_pair colors:
barplot(dat, beside = TRUE, col = my_pair)

## ----transparency1-pal, fig.width = 5, fig.asp = .8, fig.align = 'center', collapse = TRUE----
seecol(pal_unikn, alpha = 0.5)

## ----transparency-four, fig.width = 5, fig.asp = .8, fig.align = 'center'-----
four_cols <- usecol(c("steelblue", "gold", "firebrick", "forestgreen"), alpha = 2/3)

seecol(four_cols, title = "Four named colors with added transparency")

## ----transparency-all, fig.width = 5, fig.height = 4, fig.align = 'center'----
seecol("grad", alpha = 0.67, title = "Seeing color palettes with added transparency")

## ----transparency-ac, fig.width = 5, fig.asp = .8, fig.align = 'center'-------
my_cols <- c("black", "firebrick", "forestgreen", "gold", "steelblue")
seecol(ac(my_cols, alpha = c(rep(.25, 5), rep(.75, 5))))

## ----compare-custom-palettes, fig.width = 5, fig.height = 3, fig.align = 'center'----
# Define 2 palettes: 
pal1 <- c(rev(pal_seeblau), "white", pal_bordeaux)
pal2 <- usecol(c(Karpfenblau, Seeblau, "gold"), n = 10)

# Show the my_pair palette from above, the 2 palettes just defined, and 2 pre-defined palettes:  
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair))

## ----set-custom-palette-names, fig.width = 5, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), 
       pal_names = c("my_pair", "blue_bord", "blue_yell"),
       title = "Labeling custom color palettes")

## ----set-all-palette-names, fig.width = 5, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), 
       pal_names = c("my_pair", "blue_bord", "blue_yell", "blue_black", "mix_pair"),
       title = "Comparing and labeling custom color palettes")

## ----subset-compare, fig.width = 5, fig.height = 3, fig.align = 'center'------
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), n = 5)

## ----superset-compare, fig.width = 5, fig.height = 3, fig.align = 'center'----
seecol(list(my_pair, pal1, pal2, pal_unikn, pal_unikn_pair), n = 15)

## ----simcol-1, fig.width = 5, fig.asp = .8, fig.align = 'center', fig.show = 'hold'----
simcol("deeppink")

## ----simcol-2, fig.width = 5, fig.asp = .8, fig.align = 'center', fig.show = 'hold'----
simcol("deepskyblue", col_candidates = pal_unikn, tol = c(50, 50, 100))

## ----grepal-1, fig.width = 6, fig.height = 4, fig.align = 'center', fig.show = 'hold'----
grepal("purple")  # get & see 10 names of colors() with "purple" in their name

## ----grepal-2-----------------------------------------------------------------
length(grepal("gr(a|e)y", plot = FALSE))    # shades of "gray" or "grey"
length(grepal("^gr(a|e)y", plot = FALSE))   # shades starting with "gray" or "grey"
length(grepal("^gr(a|e)y$", plot = FALSE))  # shades starting and ending with "gray" or "grey"

## ----grepal-3, fig.width = 5, fig.asp = .8, fig.align = 'center'--------------
grepal("see", pal_unikn)  # finding "see" in (the names of) pal_unikn (as df)
grepal("blau", pal_unikn_pref, plot = FALSE)  # finding "blau" in pal_unikn_pref

## ----shades-of-1, fig.width = 5, fig.asp = .8, fig.align = 'center'-----------
seecol(shades_of(n = 7, col_1 = Karpfenblau), title = "Shades of Karpfenblau")

## ----shades-of-2, fig.width = 5, fig.asp = .8, fig.align = 'center'-----------
shady_1 <- usecol(c("deeppink", "gold"), 5)
shady_2 <- shades_of(5, "deeppink", "gold")
all.equal(shady_1, shady_2)

seecol(shady_2, title = "A bi-polar color gradient")

## ----newpal-1, fig.width = 5, fig.asp = .8, fig.align = 'center'--------------
col_flag <- c("#000000", "#dd0000", "#ffce00")  # source: www.schemecolor.com

flag_de  <- newpal(col = col_flag,
                   names = c("black", "red", "gold"))

seecol(flag_de, title = "Defining a flag_de color palette")

