install.packages("ggplot2", dependencies = FALSE)
install.packages("remotes")
install.packages("dplyr")
remotes::install_github("LCBC-UiO/ggseg", build_vignettes = FALSE)
remotes::install_github("LCBC-UiO/ggseg3d")
install.packages("devtools")
library(devtools)
devtools::install_github("LCBC-UiO/ggsegJHU")
remotes::install_github("LCBC-UiO/ggsegICBM")

library(ggseg)
library(ggseg3d)
library(ggsegJHU)
library(dplyr)
library(tidyr)
library(ggsegICBM)

ggseg(mapping=aes(fill=region), position = "stacked") +
  scale_fill_brain("dk") +
  theme_void()

ggseg(mapping=aes(fill=region), position="stacked", show.legend = F) +
  scale_fill_brain("dk") +
  theme_void() +
  ggtitle("Desikan-Killany Cortical Atlas")

ggseg(atlas="aseg", mapping=aes(fill=region)) +
  theme_void()

ggseg(atlas="jhu", mapping=aes(fill=region))



UFFA = data.frame(
  region = c("Uncinate fasciculus", "Uncinate fasciculus"),
  FA = c(0.56, 0.56, 0.54, 0.69, 0.51, 0.55, 0.62, 0.65, 0.57, 0.67, 0.56, 0.63, 0.62, 0.65, 0.61, 0.64, 0.54, 0.58, 0.66, 0.46, 0.61, 0.63, 0.60, 0.66, 0.58),
  group = c(rep("Alzheimer's Disease",9), rep("Healthy Controls",16)),
  hemi = c(rep("right", 25), rep("left", 25)),
  stringsAsFactors = FALSE)

UFFA = UFFA %>%
  group_by(group)

ggseg(.data = UFFA, atlas="jhu", colour="white", mapping=aes(fill=FA)) +
  facet_wrap(~group, ncol=1) +
  theme(legend.position = "right") +
  scale_fill_gradient(low="firebrick",high="goldenrod")


CTFA = data.frame(
  region = c("Corticospinal tract", "Corticospinal tract"),
  MD = c(0.000740758, 0.000720423, 0.000725086, 0.000683985, 0.000704789, 0.000788774, 0.000712517, 0.000723228, 0.000758234, 0.00065418, 0.00071901, 0.00069034, 0.000672955, 0.000614714, 0.000672763, 0.000638529, 0.000659986, 0.000670846, 0.000669096, 0.000676949, 0.000662741, 0.000656809, 0.000708539, 0.000706194, 0.000750527),
  group = c(rep("Alzheimer's Disease",9), rep("Healthy Controls",16)),
  hemi = c(rep("right", 25), rep("left", 25)),
  stringsAsFactors = FALSE)

CTFA = CTFA %>%
  group_by(group)

ggseg(.data = CTFA, atlas="jhu", colour="white", mapping=aes(fill=MD)) +
  facet_wrap(~group, ncol=1) +
  theme(legend.position = "right") +
  scale_fill_gradient(low="firebrick",high="goldenrod")


someData = data.frame(
  roi = c("025","026"),
  MD = c(0.000740758, 0.000720423, 0.000725086, 0.000683985, 0.000704789, 0.000788774, 0.000712517, 0.000723228, 0.000758234, 0.00065418, 0.00071901, 0.00069034, 0.000672955, 0.000614714, 0.000672763, 0.000638529, 0.000659986, 0.000670846, 0.000669096, 0.000676949, 0.000662741, 0.000656809, 0.000708539, 0.000706194, 0.000750527),
  stringsAsFactors = FALSE)


ggseg3d(.data = someData, atlas = icbm_3d,
        colour = "MD", text = "MD",
        options.legend = list(title=list(text="MD")),
        na.alpha= 0,
        palette = c("firebrick" = 0, "goldenrod" = 1)) %>%
  add_glassbrain() %>%
  pan_camera("left lateral") %>%
  remove_axes()



