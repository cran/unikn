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

## ----plot-par-set, echo = FALSE-----------------------------------------------
opar <- par(no.readonly = TRUE)  # store current settings

par(mar = c(1, 1, 2.1, 1), oma = c(0, 0, 0, 0))  # reduce margins

set.seed(6 * pi)  # reproducible randomness

## ----demo-scatterplot, eval = TRUE, fig.width = 5, fig.asp=.95, fig.align = 'center', collapse = TRUE----
my_col <- usecol(pal_unikn, alpha = .50)  # with transparency

plot(x = runif(99), y = runif(99), type = "p", 
     pch = 16, cex = 4,
     col = my_col,
     main = "99 transparent dots", axes = FALSE, xlab = NA, ylab = NA)

## ----plot-par-reset, echo = FALSE---------------------------------------------
par(opar)  # re-store current settings

## ----use-pal-ggplot2, eval = FALSE, fig.width = 6, fig.asp = .618, fig.align = 'center', collapse = TRUE----
#  # 0. Data: ----
#  # Example based on https://www.r-graph-gallery.com/137-spring-shapes-data-art/
#  n <- 50
#  names <- paste("G_", seq(1, n), sep = "")
#  df <- data.frame()
#  
#  set.seed(3)
#  for (i in seq(1:30)){
#      data <- data.frame(matrix(0, n, 3))
#      data[, 1] <- i
#      data[, 2] <- sample(names, nrow(data))
#      data[, 3] <- prop.table(sample( c(rep(0, 100), c(1:n)), nrow(data)))
#      df <- rbind(df, data)}
#  colnames(df) <- c("X","group","Y")
#  df <- df[order(df$X, df$group) , ]
#  
#  
#  # 1. Colors: ----
#  # A. using RColorBrewer:
#  # library(RColorBrewer)
#  
#  # cur_col <- brewer.pal(11, "Paired")
#  # cur_col <- colorRampPalette(cur_col)(n)
#  # cur_col <- cur_col[sample(c(1:length(cur_col)), size = length(cur_col))]  # randomize
#  
#  # B. using unikn colors:
#  library(unikn)
#  
#  cur_col <- usecol(pal = pal_unikn, n = n)
#  # cur_col <- cur_col[sample(c(1:length(cur_col)), size = length(cur_col))]  # randomize
#  
#  # 2. Plotting: ----
#  
#  library(ggplot2)
#  
#  ggplot(df, aes(x = X, y = Y, fill = group)) +
#    geom_area(alpha = 1, color = Grau, size = .01 ) +
#    scale_fill_manual(values = cur_col) +
#    theme_void() +
#    theme(legend.position = "none")

## ----seecol-example-1, fig.width = 5, fig.asp = .8, fig.align = 'center'------
col_pal <- hcl.colors(10, "Vik")  # some color palette

seecol(col_pal)  # see its colors and details 

## ----set-seed-HCL-pals, echo = FALSE------------------------------------------
set.seed(4 * pi)  # reproducible randomenss 

## ----seecol-example-2a, echo = FALSE, fig.width = 6, fig.asp = 1.0, fig.align = 'center'----
# Parameters:
n_col <-  8   # colors in each palette
n_pal <- 20   # length(hcl.pals())
ptype <- NULL # c("diverging", "divergingx", "qualitative", "sequential")[4] 

s_pal <- sample(x = hcl.pals(type = ptype), size = n_pal, replace = FALSE)
s_pal <- sort(s_pal)

# Initialize:
t_lbl <- paste0("See ", n_pal, " random HCL color palettes (n = ", n_col, ")") 
l_pal <- vector("list", n_pal)  # lists of palettes

# Loop:
for (i in 1:n_pal){
  
  l_pal[[i]] <- hcl.colors(n = n_col, palette = s_pal[i])
  
}

## ----seecol-example-2b, fig.width = 6, fig.asp = 1.0, fig.align = 'center'----
seecol(pal = l_pal, 
       pal_names = s_pal,
       col_brd = "white", lwd_brd = 1,
       title = t_lbl)

## ----newpal-example, fig.width = 5, fig.asp = .9, fig.align = 'center'--------
# 1. Choose colors:
# Google logo colors (from <https://www.schemecolor.com/google-logo-colors.php>)

# 2. Define colors (as vector):
color_google <- c("#4285f4", "#34a853", "#fbbc05", "#ea4335")

# 3. Define color names (as vector):
names_google <- c("blueberry", "sea green", "selective yellow", "cinnabar")

# 4. Define color palette:
pal_google <- newpal(color_google, names_google)

# 5. Inspect color palette:
seecol(pal_google, 
       col_brd = "white", lwd_brd = 8,
       title = "Colors of the Google logo")

## ----grepal-example-1, fig.width=5, fig.height=4, fig.align = 'center'--------
# Get color palettes matching a pattern:
pal_1 <- grepal("orange")
pal_2 <- grepal("olive")
pal_3 <- grepal("white")

# See individual palettes:
# seecol(pal_1, title = "Shades of 'orange' colors()")
# seecol(pal_2, title = "Shades of 'olive' colors()")
seecol(pal_3, title = "Shades of 'white' colors()", col_bg = "grey90")

## ----grepal-example-2, fig.width=6, fig.asp=.50, fig.align = 'center'---------
# See multiple color palettes:
seecol(pal = list(pal_1, pal_2, pal_3), 
       pal_names = c("orange", "olive", "white"), 
       col_bg = "grey90")

## ----grepal-example-3, fig.width=6, fig.align=.50, fig.align = 'center'-------
# Search colors() with specific patterns (in their names): 
blues    <- grepal("blue$")   # ending on "blue"
oranges  <- grepal("orange")  # containing "orange"
purpviol <- grepal("purple|violet")  # containing "purple" or "violet"

# Search unikn palettes for color names: 
blaus_1 <- grepal("blau", pal_unikn)
blaus_2 <- grepal("blau", pal_karpfenblau)
pinks <- grepal("pink", pal_pinky)
peach <- grepal("peach", pal_peach)
baux  <- grepal("bordeaux", pal_bordeaux)

# See multiple color palettes: 
seecol(list(blues, oranges, purpviol, 
            c(blaus_1, blaus_2, pinks, peach, baux)),
       pal_names = c("blues", "oranges", "purpviol", "unikn colors"),
       title ="Comparing custom color palettes")

