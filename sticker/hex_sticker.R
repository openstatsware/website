library(cropcircles)
library(magick)
library(tidyverse)
library(ggpath)
library(ragg)
library(glue)
library(svglite)

x <- image_read("sticker/hex.png")
xhex <- hex_crop(x, border_size = 150, border_colour = "#FFC300")
hex <- ggplot() +
  geom_from_path(aes(0.5, 0.5, path = xhex)) +
  xlim(0, 1) +
  ylim(0, 1) +
  theme_void() +
  coord_fixed()
hex

# .png versions
dpi <- c(300, 600, 1200)
for (this in dpi) {
  ggsave(filename = glue("sticker/openstatsware-hex-{this}.png"), plot = hex, height = 5, width = 5, dpi = this, device = agg_png)
}

# .svg version
ggsave(filename = "sticker/openstatsware-hex.svg", plot = hex, height = 5, width = 5, dpi = this, device = svglite::svglite)

# Attribution for png icon:
# <a href="https://www.flaticon.com/free-icons/technology" title="technology icons">Technology icons created by Kalashnyk - Flaticon</a>

# Rounded text version
xr <- image_read("sticker/hex-round.png")
xrhex <- hex_crop(xr, border_size = 150, border_colour = "#FFC300")
hexr <- ggplot() +
  geom_from_path(aes(0.5, 0.5, path = xrhex)) +
  xlim(0, 1) +
  ylim(0, 1) +
  theme_void() +
  coord_fixed()
hexr

# .png versions
dpi <- c(300, 600, 1200)
for (this in dpi) {
  ggsave(filename = glue("sticker/openstatsware-hex-round-{this}.png"), plot = hexr, height = 5, width = 5, dpi = this, device = agg_png)
}

# .svg version
ggsave(filename = "sticker/openstatsware-hex-round.svg", plot = hexr, height = 5, width = 5, dpi = this, device = svglite::svglite)

# Attribution for developer.png icon:
# <a href="https://www.flaticon.com/free-icons/web-development" title="web-development icons">Web-development icons created by Freepik - Flaticon</a>
