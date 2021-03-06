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
               # ## Default figure options:
               # fig.width = 7.2, 
               # fig.asp = .618, # golden ratio
               # out.width = "75%",
               fig.align = "center"
               )

## ----load-pkg-text, message = FALSE, warning = FALSE--------------------------
# install.packages('unikn')  # install unikn from CRAN client
library('unikn')             # loads the package

## ----load-pkg, message = FALSE, warning = FALSE-------------------------------
library(unikn)  # load unikn package

## ----slide-def, fig.align = 'center', fig.width = 4, fig.height = 3-----------
slide()  # plot default slide

## ----xbox-def, fig.align = 'center', fig.width = 2, fig.height = 2------------
xbox()  # plot default xbox

## ----slide-col, fig.align = 'center', fig.width = 4, fig.height = 3-----------
slide(col = pal_seeblau[[1]], border = Petrol, lwd = 5)  # set colors of slide background and border
slide(col = pal_peach[[2]], border = NA)  # colored slide without a border

## ----xbox-col, fig.align = 'center', fig.width = 2, fig.height = 2------------
xbox(col = Pinky)  # set background color of xbox

## ----slide-dim, fig.align = 'center', fig.width = 6, fig.height = 2-----------
slide(dim = c(3, 1))  # a slide 3 times wider than high

## ----xbox-dim, fig.align = 'center', fig.width = 2, fig.height = 4------------
xbox(col = Petrol, dim  = c(1, 2))  # an xbox 2 times higher than wide

## ----mark-demo-label, echo = FALSE, fig.width = 3, fig.height = 3-------------
lbl_blank <- c("                                                ",
              "                                      ",
              "                                                      ",
              "                                                ",
              "                              ")

lbl_blank <- c(paste(rep(" ", 48), collapse = ""), 
               paste(rep(" ", 38), collapse = ""), 
               paste(rep(" ", 54), collapse = ""), 
               paste(rep(" ", 48), collapse = ""), 
               paste(rep(" ", 30), collapse = ""))

## ----mark-demo-fig, echo = FALSE, fig.width = 3, fig.height = 3---------------
# (a) Create a new plot (of type "slide"):
mark(labels = lbl_blank,
     x = 0, y = .85, y_layout = .03,
     col_bg = Seeblau,
     cex = 1.0,
     new_plot = "slide")

## ----set-par, echo = FALSE----------------------------------------------------
# Set par:
opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
par(mar = c(1, 1, 1, 1))

## ----mark-messy-plot, echo = TRUE, fig.width = 6, fig.height = 4--------------
# Some pre-existing plot: 
n <- 20
set.seed(1)
par(mar = c(0, 0, 0, 0))
plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .2),
     axes = FALSE, xlab = "", ylab = "")

# Add 1 marked label:
mark(labels = "Some messy plot", x = .02, y = .9)

# Add 2 more marked labels:
mark(labels = c("Note something here.", "More highlighting here."), 
     x = c(.1, .6), y = c(.2, .4),
     col_bg = c(pal_seeblau[[2]], pal_peach[[3]]), cex = 1.2)

## ----reset-opar, echo = FALSE-------------------------------------------------
# Restore plot settings:
par(opar)

## ----mark-new-plot, echo = TRUE, fig.width = 4, fig.height = 4----------------
# A sentence to plot: 
s <- c("Markieren",
       "ist ein Bestandteil",
       "von Studieren.")

# Create a new plot (of type "slide"):
mark(labels = s,
     x = 0, y = .85, y_layout = .03,
     col_bg = Seeblau,
     cex = 1.5,
     new_plot = "slide")

# Add text to the same plot:
mark(labels = s,
     x = 0, y = .40, y_layout = .03,
     col_bg = pal_pinky[[2]],
     cex = 1.5, 
     new_plot = "none")

## ----uline-demo, echo = FALSE, fig.width = 3, fig.height = 3------------------
slogan <- c("Geradlinig", "Authentisch", "Beweglich", "Offen", "Paradiesisch")
uline(labels = slogan,
      x = 0, y = .9, y_layout = "even",
      cex = 1.1, font = 2,
      new_plot = "blank")

## ----uline-ex1, echo = TRUE, fig.width = 4.5, fig.height = 3------------------
lbl_uline <- c("This is neat, true, and terribly important")
uline(labels = lbl_uline, new_plot = "blank", y = .6, cex = 1.1)  # create a new plot
uline(labels = "(which is why we underline it).", y = .45, cex = 1)  # add to plot

## ----uline-ex2, echo = TRUE, fig.width = 3, fig.height = 3--------------------
slogan <- c("Geradlinig", "Farbenfroh", "Beweglich", "Bunt", "Paradiesisch")
uline(labels = slogan,
      x = c(0, .5), y = .9, y_layout = "even",
      col = c("black", Bordeaux), col_bg = c(Seeblau, Seegruen), 
      cex = 1.1, font = 2, new_plot = "blank")

## ----post-demo, echo = FALSE, fig.width = 4, fig.height = 2-------------------
xbox(col = Seegruen, dim = c(4, 2))
post(labels = "Please note", x = .1, y = 1.2, cex = 1.2, font = 2, new_plot = FALSE)
post(labels = c("For best results, always design and view", "boxes with text at the size at which they", "are saved and displayed later."), 
     x = .1, y = .8, y_layout = .1, cex = 1, font = 1, new_plot = FALSE)

## ----post-logo, echo = TRUE, fig.width = 2, fig.height = 2, fig.show = "hold"----
# Badge (to view as 250 x 250 pixel):
post(labels = "ToDo", y = .35, 
     col = "white", col_bg = pal_signal[[1]],
     cex = 3, font = 2, new_plot = "xbox")  

# Badge (to view as 250 x 250 pixel):
post(labels = "R", y = .35, 
     col = "white", col_bg = pal_seeblau[[5]],
     cex = 8, font = 2, new_plot = "xbox")

## ----post-logo-hide, echo = FALSE, eval = FALSE-------------------------------
#  # To be viewed/saved at 250 x 250 pixels:
#  
#  # ds4psy course logo:
#  post(labels = "ds4psy", x = .05, y = .34,
#       col = "white", col_bg = pal_seeblau[[5]],
#       cex = 2.2, font = 2, new_plot = "xbox")
#  
#  # i2ds course logo:
#  post(labels = "i2ds", x = .05, y = .34,
#       col = "white", col_bg = pal_pinky[[4]],
#       cex = 2.2, font = 2, new_plot = "xbox")

## ----post-address, echo = TRUE, fig.width = 3, fig.height = 3-----------------
address <- c("Dr. B. F. Skinner", " ",
             "Department of Psychology",
             "Office F101",
             "Tel.: +49 7531 88-0815",
             "Fax: +49 7531 88-0810",
             "b.f.skin@uni-konstanz.de")

post(labels = "Contact",
     y = .7,
     cex = 1.2, font = 2,
     col_bg = Petrol,
     new_plot = "xbox")  # create new plot 

post(labels = address,
     y = .5, y_layout = .03,
     new_plot = "none")  # add to plot

## ----heading-demo, echo = FALSE, fig.width = 4, fig.height = 3----------------
heading(labels = c("Ich bin", "eine", "Headline."))

## ----heading-warn, echo = TRUE, message = TRUE, fig.width = 4, fig.height = 3----
# Beware of step-wise arrangements:
heading(labels = c("Ich", "bin keine", "gute Headline."))

# To avoid warning:
heading(labels = c("Ich bin", "eine alternative", "Headline."))

## ----heading-col, echo = TRUE, fig.width = 4, fig.height = 3------------------
heading(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
        col = "white", col_bg = c(Pinky, Seegruen, Bordeaux, Karpfenblau))

## ----url-post, fig.align = 'center', fig.width = 2, fig.height = 2------------
my_url <- url_unikn("https://www.uni-konstanz.de/")  # input URL as copied from web browser
my_url  # formatted URL

# Put URL at bottom of an xbox:
post(labels = my_url, x = .05, y = .1, font = 4, 
     col_bg = pal_seeblau[[5]], new_plot = "xbox")

