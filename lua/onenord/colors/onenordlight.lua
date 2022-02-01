local colors = {
    fg = "#2E3440",
    fg_light = "#4C566A",
    bg = "#F7F8FA",
    gray = "#838FA6",
    light_gray = "#646A76",
    cyan = "#3EA1AD",
    blue = "#3879C5",
    dark_blue = "#1B40A6",
    green = "#48A53D",
    light_green = "#5F9E9D",
    dark_red = "#C53B40",
    red = "#CB4F53",
    light_red = "#D16366",
    pink = "#E85B7A",
    dark_pink = "#E44675",
    orange = "#EE5E25",
    yellow = "#BA793E",
    purple = "#9F4ACA",
    light_purple = "#9665AF",
    none = "NONE",

    -- none       = "NONE",
    -- bg         = "#192330",
    -- fg         = "#cdcecf",
    -- fg_light   = "#f2f2f2",
    -- fg_gutter  = "#3b4261",
    -- gray       = "#526175",
    -- light_gray = "#475072",
    -- black      = "#393b44",
    -- white      = "#dfdfe0",
    --
    -- -- standard palettes
    -- cyan       = "#63cdcf",
    -- blue       = "#719cd6",
    -- red        = "#c94f6d",
    -- orange     = "#f4a261",
    -- yellow     = "#dbc074",
    -- green      = "#81b29a",
    -- purple     = "#d67ad2",
    --
    -- -- brighter palettes
    -- light_blue   = "#84cee4",
    -- light_cyan   = "#59f0ff",
    -- light_red    = "#d6616b",
    -- light_orange = "#f6a878",
    -- light_yellow = "#ffe37e",
    -- light_green  = "#58cd8b",
    -- light_purple = "#df97db",
    --
    -- -- darker palettes
    -- dark_blue    = "#668aab",
    -- dark_cyan    = "#69a7ba",
    -- dark_red     = "#a54e56",
    -- dark_orange  = "#b46950",
    -- dark_yellow  = "#d9b263",
    -- dark_green   = "#8aa872",
    -- dark_purple  = "#a96ca5",
}

-- more semantically meaningful colors

colors.error = colors.dark_red
colors.warn = colors.orange
colors.info = colors.green
colors.hint = colors.purple

colors.diff_add = colors.green
colors.diff_add_bg = "#C3E6BE"
colors.diff_change = colors.dark_blue
colors.diff_change_bg = "#DDE6EE"
colors.diff_remove = colors.red
colors.diff_remove_bg = "#F9D8D6"
colors.diff_text_bg = "#C9D7E5"

colors.active = "#EFF0F2"
colors.float = "#EDEEF0"
colors.highlight = "#EAEBED"
colors.highlight_dark = "#DFE1E4"
colors.selection = "#DCDEE1"

return colors
