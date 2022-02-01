local colors = {
    -- basic
    none         = "NONE",
    bg           = "#2E3440",
    fg           = "#C8D0E0",
    fg_light     = "#E5E9F0",
    fg_gutter    = "#4B5668", -- new
    gray         = "#646A76",
    light_gray   = "#6C7A96",
    black        = "#3B4252", -- new
    -- white        = "#e5e9f0", -- new
    white        = "#ffffff", -- new

    -- standard palettes
    cyan         = "#88C0D0",
    blue         = "#81A1C1",
    red          = "#BF616A", -- modified
    orange       = "#D08F70",
    yellow       = "#EBCB8B",
    green        = "#A3BE8C",
    purple       = "#B48EAD", -- modified

    -- brighter palettes
    light_blue   = "#8cafd2", -- new
    light_cyan   = "#93ccdc", -- new
    light_red    = "#DE878F",
    light_orange = "#d89079", -- new
    light_yellow = "#f0d399", -- new
    light_green  = "#b1d196", -- modified
    light_purple = "#c895bf", -- new

    -- darker palettes
    dark_blue    = "#668aab", -- modified
    dark_cyan    = "#69a7ba", -- new
    dark_red     = "#a54e56", -- modified
    dark_orange  = "#b46950", -- new
    dark_yellow  = "#d9b263", -- new
    dark_green   = "#8aa872", -- new
    dark_purple  = "#a96ca5", -- new
}
-- more semantically meaningful colors

colors.error = colors.dark_red
colors.warn = colors.orange
colors.info = colors.green
colors.hint = colors.purple

colors.diff_add = colors.green
colors.diff_add_bg = "#394E3D"
colors.diff_change = colors.dark_blue
colors.diff_change_bg = "#39495D"
colors.diff_remove = colors.red
colors.diff_remove_bg = "#4D2B2E"
colors.diff_text_bg = "#405D7E"

colors.active = "#353B49"
colors.float = "#3B4252"
colors.highlight = "#3F4758"
colors.highlight_dark = "#434C5E"
colors.selection = "#4C566A"

return colors
