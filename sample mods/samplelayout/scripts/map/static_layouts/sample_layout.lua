return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 6,
  height = 6,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  tilesets = {
    {
      name = "ground",
      firstgid = 1,
      filename = "../../../layout_source/dont_starve/ground.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../../../layout_source/dont_starve/tiles.png",
      imagewidth = 512,
      imageheight = 384,
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "BG_TILES",
      x = 0,
      y = 0,
      width = 6,
      height = 6,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 2, 2, 0,
        11, 1, 1, 1, 1, 11,
        11, 1, 6, 6, 6, 11,
        11, 10, 10, 6, 6, 11,
        11, 10, 10, 6, 6, 11,
        0, 0, 1, 1, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "FG_OBJECTS",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "grass",
          shape = "rectangle",
          x = 227,
          y = 169,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "grass",
          shape = "rectangle",
          x = 207,
          y = 274,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "grass",
          shape = "rectangle",
          x = 316,
          y = 171,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "flower_evil",
          shape = "rectangle",
          x = 143,
          y = 302,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "flower_evil",
          shape = "rectangle",
          x = 115,
          y = 249,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
