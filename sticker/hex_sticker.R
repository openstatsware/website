library(hexSticker)
library(glue)

for (.dpi in c(300, 600, 1200)) {
  print(
    sticker(
      subplot = "sticker/software.png",
      s_x = 1,
      s_y = 0.92,
      s_width = 0.8,
      s_height = 0.8,
      filename = glue("sticker/sticker-{.dpi}.png"),
      dpi = .dpi,
      asp = 0.863,
      h_color = "#455A64",
      h_fill = "#FFFEFE",
      package = ""
    )
  )
}
# Attribution for png icon:
# <a href="https://www.flaticon.com/free-icons/technology" title="technology icons">Technology icons created by Kalashnyk - Flaticon</a>
