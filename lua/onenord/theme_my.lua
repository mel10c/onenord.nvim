local onenord = require("onenord.colors")
local config = require("onenord.config").options

local function italicize(group)
  group["style"] = "italic"
end

local function remove_background(group)
  group["bg"] = onenord.none
end

local theme = {}

function theme.load_syntax()
  -- Syntax highlight groups

  local syntax = {
    -- int, long, char, etc.
    Type = { fg = onenord.yellow },
    -- static, register, volatile, etc.
    StorageClass = { fg = onenord.yellow },
    -- struct, union, enum, etc.
    Structure = { fg = onenord.yellow },

    -- any constant
    Constant = { fg = onenord.orange },
    -- any character constant: 'c', '\n'
    Character = { fg = onenord.green },
    -- a number constant: 5
    Number = { fg = onenord.light_orange},
    -- a floating point constant: 2.3e10
    Float = { fg = onenord.light_orange },
    -- a boolean constant: TRUE, false
    Boolean = { fg = onenord.light_orange },

    -- any statement
    Statement = { fg = onenord.light_purple },
    -- normal if, then, else, endif, switch, etc.
    Conditional = { fg = onenord.light_purple },
    -- normal any other keyword
    Repeat = { fg = onenord.light_purple },
    -- case, default, etc.
    Label = { fg = onenord.light_purple },
    -- sizeof", "+", "*", etc.
    Operator = { fg = onenord.fg_gutter },
    -- normal for, do, while, etc.
    Keyword = { fg = onenord.purple },
    -- try, catch, throw
    Exception = { fg = onenord.purple },

    -- generic Preprocessor
    PreProc = { fg = onenord.purple },
    -- preprocessor #include
    Include = { fg = onenord.blue },
    -- preprocessor #define
    Define = { fg = onenord.red },
    -- same as Define
    Macro = { fg = onenord.red },
    -- preprocessor #if, #else, #endif, etc.
    PreCondit = { fg = onenord.purple },

    -- any special symbol
    Special = { fg = onenord.blue }, -- from (light_red)
    -- special character in a constant
    SpecialChar = { fg = onenord.light_red },
    -- you can use CTRL-] on this
    Tag = { fg = onenord.green },
    -- character that needs attention like , or .
    Delimiter = { fg = onenord.dark_blue },
    -- special things inside a comment
    SpecialComment = { fg = onenord.light_gray },
    -- debugging statements
    Debug = { fg = onenord.yellow },

    -- text that stands out, HTML links
    Underlined = { fg = onenord.green, style = "underline" },
    Bold = { style = "bold" }, -- new
    Italic = { style = "italic" }, -- new

    -- left blank, hidden
    Ignore = { fg = onenord.cyan, bg = onenord.bg, style = "bold" },

    -- any erroneous construct
    Error = { fg = onenord.error, bg = onenord.none, style = "bold,underline" },
    -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Todo = { fg = onenord.yellow, bg = onenord.none, style = "bold,italic" },

    -- normal function names
    Function = { fg = onenord.blue },
    -- any variable name
    Identifier = { fg = onenord.light_blue }, -- from (fg)

    -- any string
    String = { fg = onenord.green },

    htmlLink = { fg = onenord.green, style = "underline" },
    htmlH1 = { fg = onenord.purple, style = "bold" },
    htmlH2 = { fg = onenord.blue, style = "bold" },
    htmlH3 = { fg = onenord.green, style = "bold" },
    htmlH4 = { fg = onenord.yellow, style = "bold" },
    htmlH5 = { fg = onenord.orange, style = "bold" },

    markdownH1 = { fg = onenord.dark_blue, style = "bold" },
    markdownH2 = { fg = onenord.blue, style = "bold" },
    markdownH3 = { fg = onenord.cyan, style = "bold" },
    markdownH4 = { fg = onenord.light_blue },
    markdownH5 = { fg = onenord.orange },
    markdownH6 = { fg = onenord.light_blue },
    markdownH1Delimiter = { fg = onenord.dark_blue },
    markdownH2Delimiter = { fg = onenord.blue },
    markdownH3Delimiter = { fg = onenord.cyan },
    markdownH4Delimiter = { fg = onenord.light_blue },
    markdownH5Delimiter = { fg = onenord.orange },
    markdownH6Delimiter = { fg = onenord.light_blue },
    markdownBold = { fg = onenord.white, style = "bold" },
    markdownItalic = { fg = onenord.light_yellow , style = "italic" },
    markdownBlockquote = { fg = onenord.light_gray },
    markdownCodeBlock = { fg = onenord.fg },
    markdownCode = { fg = onenord.purple },
    markdownCodeDelimiter = { fg = onenord.purple },
    markdownId = { fg = onenord.yellow },
    markdownIdDeclaration = { fg = onenord.purple },
    markdownIdDelimiter = { fg = onenord.light_gray },
    markdownLinkDelimiter = { fg = onenord.light_gray },
    markdownListMarker = { fg = onenord.light_gray, style = "bold" },
    markdownOrderedListMarker = { fg = onenord.light_gray, style = "bold" },
    markdownRule = { fg = onenord.purple },
    markdownLinkText = { fg = onenord.dark_blue },
    markdownUrl = { fg = onenord.cyan, style = "underline" },
  }

  -- Options:

  -- Italic comments
  if config.italics.comments then
    italicize(syntax.Comment)
  end

  -- Italic Keywords
  if config.italics.keywords then
    italicize(syntax.Conditional)
    italicize(syntax.Keyword)
    italicize(syntax.Repeat)
  end

  -- Italic Function names
  if config.italics.functions then
    italicize(syntax.Function)
  end

  if config.italics.variables then
    italicize(syntax.Identifier)
  end

  if config.italics.strings then
    italicize(syntax.String)
  end

  return syntax
end

function theme.load_editor()
  -- Editor highlight groups

  local editor = {
    -- normal comments
    Comment = { fg = onenord.light_gray },
    -- used for the columns set with 'colorcolumn'
    ColorColumn = { fg = onenord.none, bg = onenord.float },
    -- placeholder characters substituted for concealed text (see 'conceallevel')
    Conceal = { fg = onenord.dark_blue, bg = onenord.bg },
    -- the character under the cursor
    -- Cursor = { fg = onenord.fg, bg = onenord.none, style = "reverse" },
    Cursor = { fg = onenord.bg, bg = onenord.fg },
    -- The character under the cursor when |language-mapping| is used (see 'guicursor')
    lCursor = { fg = onenord.bg, bg = onenord.fg },
    -- like Cursor, but used when in IME mode
    CursorIM = { fg = onenord.bg, bg = onenord.fg },
    -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorColumn = { fg = onenord.none, bg = onenord.float },
    -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLine = { fg = onenord.none, bg = onenord.active },

    -- directory names (and other special names in listings)
    Directory = { fg = onenord.blue, bg = onenord.none },
    -- diff mode: Added line
    DiffAdd = { fg = onenord.none, bg = onenord.diff_add_bg },
    -- diff mode: Changed line
    DiffChange = { fg = onenord.none, bg = onenord.diff_change_bg },
    -- diff mode: Deleted line
    DiffDelete = { fg = onenord.none, bg = onenord.diff_remove_bg },
    -- diff mode: Changed text within a changed line
    DiffText = { fg = onenord.none, bg = onenord.diff_text_bg },
    -- error messages
    ErrorMsg = { fg = onenord.error },
    -- line used for closed folds
    Folded = { fg = onenord.dark_blue, bg = onenord.none, style = "italic" },
    -- 'foldcolumn'
    FoldColumn = { fg = onenord.light_gray },
    -- 'signcolumn'
    SignColumn = { fg = onenord.fg, bg = onenord.bg },
    -- column where |signs| are displayed
    SignColumnSB = { bg = onenord.active, fg = onenord.fg_light },
    -- |:substitute| replacement text highlighting
    Substitute = { bg = onenord.red, fg = onenord.black },

    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr = { fg = onenord.fg_gutter },
    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineNr = { fg = onenord.blue, style = "bold" },
    -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen = { fg = onenord.dark_orange, style = "bold" },
    -- 'showmode' message (e.g., "-- INSERT -- ")
    ModeMsg = { fg = onenord.blue, style = "bold" },
    -- |more-prompt|
    MoreMsg = { fg = onenord.blue, style = "bold" },
    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
    -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    -- See also |hl-EndOfBuffer|.
    NonText = { fg = onenord.gray },

    -- normal text and background color
    -- Normal = { fg = onenord.fg, bg = onenord.bg },
    Normal = { fg = onenord.fg },
    -- normal text in non-current windows
    NormalNC = { fg = onenord.fg, bg = onenord.bg },
    -- normal text in non-current windows
    NormalSB = { fg = onenord.gray, bg = onenord.float },
    -- normal text and background color for floating windows
    NormalFloat = { fg = onenord.fg, bg = onenord.active },
    -- floating window border
    FloatBorder = { fg = onenord.blue, bg = onenord.active },

    -- normal item |hl-Pmenu|
    Pmenu = { fg = onenord.fg, bg = onenord.float },
    -- selected item |hl-PmenuSel|
    PmenuSel = { bg = onenord.selection },
    -- scrollbar |hl-PmenuSbar|
    PmenuSbar = { bg = onenord.float },
    -- thumb of the scrollbar  |hl-PmenuThumb|
    PmenuThumb = { bg = onenord.fg },
    -- |hit-enter| prompt and yes/no questions
    Question = { fg = onenord.blue },
    -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    QuickFixLine = { bg = onenord.none, style = "bold" },
    -- Line numbers for quickfix lists
    qfLineNr = { fg = onenord.purple },

    -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    Search = { fg = onenord.blue, bg = onenord.selection, style = "bold" },
    -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    IncSearch = { fg = onenord.yellow, bg = onenord.selection, style = "bold" },
    -- Unprintable characters: text displayed differently from what it really is.
    -- But not 'listchars' whitespace. |hl-Whitespace|
    SpecialKey = { fg = onenord.dark_blue },

    -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellBad = { fg = onenord.light_red, bg = onenord.none, style = "italic", sp = onenord.red },
    -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellCap = { fg = onenord.light_yellow, bg = onenord.none, style = "italic", sp = onenord.yellow },
    -- Word that is recognized by the spellchecker as one that is used in another region.
    -- |spell| Combined with the highlighting used otherwise.
    SpellLocal = { fg = onenord.light_blue, bg = onenord.none, style = "italic", sp = onenord.cyan },
    -- Word that is recognized by the spellchecker as one that is hardly ever used.
    -- |spell| Combined with the highlighting used otherwise.
    SpellRare = { fg = onenord.light_purple, bg = onenord.none, style = "italic", sp = onenord.purple },

    -- status line of current window
    StatusLine = { fg = onenord.fg, bg = onenord.active },
    -- status lines of not-current windows Note: if this is equal to "StatusLine"
    -- Vim will use "^^^" in the status line of the current window.
    StatusLineNC = { fg = onenord.light_gray, bg = onenord.active },
    -- status line of current terminal window
    StatusLineTerm = { fg = onenord.fg, bg = onenord.active },
    -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
    -- Vim will use "^^^" in the status line of the current window.
    StatusLineTermNC = { fg = onenord.light_gray, bg = onenord.active },
    -- tab pages line, where there are no labels
    TabLineFill = { fg = onenord.light_gray, bg = onenord.bg },
    -- tab pages line, active tab page label
    TablineSel = { fg = onenord.bg, bg = onenord.dark_blue },
    Tabline = { fg = onenord.fg, bg = onenord.bg },
    -- titles for output from ":set all", ":autocmd" etc.
    Title = { fg = onenord.green, bg = onenord.none, style = "bold" },
    -- Visual mode selection
    Visual = { fg = onenord.none, bg = onenord.highlight },
    -- Visual mode selection when vim is "Not Owning the Selection".
    VisualNOS = { fg = onenord.none, bg = onenord.highlight },
    -- warning messages
    WarningMsg = { fg = onenord.warn },
    -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Whitespace = { fg = onenord.gray },
    -- current match in 'wildmenu' completion
    WildMenu = { fg = onenord.yellow, bg = onenord.none, style = "bold" },
    -- Normal mode message in the cmdline
    NormalMode = { fg = onenord.cyan, bg = onenord.none, style = "reverse" },
    -- Insert mode message in the cmdline
    InsertMode = { fg = onenord.green, bg = onenord.none, style = "reverse" },
    -- Replace mode message in the cmdline
    ReplacelMode = { fg = onenord.red, bg = onenord.none, style = "reverse" },
    -- Visual mode message in the cmdline
    VisualMode = { fg = onenord.purple, bg = onenord.none, style = "reverse" },
    -- Command mode message in the cmdline
    CommandMode = { fg = onenord.yellow, bg = onenord.none, style = "reverse" },
    Warnings = { fg = onenord.warn },

    healthError = { fg = onenord.error },
    healthSuccess = { fg = onenord.green },
    healthWarning = { fg = onenord.warn },

    -- Dashboard
    DashboardShortCut = { fg = onenord.light_gray },
    DashboardHeader = { fg = onenord.yellow },
    DashboardCenter = { fg = onenord.blue },
    DashboardFooter = { fg = onenord.green, style = "italic" },


    -- the column separating vertically split windows
    VertSplit = { fg = onenord.bg },

    EndOfBuffer = { fg = onenord.gray },
  }

  -- Options:

  -- Set transparent background
  if config.disable.background then
    remove_background(editor.Normal)
    remove_background(editor.SignColumn)
  end

  -- Set transparent cursorline
  if config.disable.cursorline then
    remove_background(editor.CursorLine)
  end

  -- Set transparent eob lines
  if config.disable.eob_lines then
    editor.EndOfBuffer["fg"] = onenord.bg
  end

  -- Add window split borders
  if config.borders then
      editor.VertSplit["fg"] = onenord.selection
  end

  return editor
end

function theme.load_terminal()
  -- dark
  vim.g.terminal_color_0 = onenord.float
  vim.g.terminal_color_8 = onenord.selection

  -- light
  vim.g.terminal_color_7 = onenord.fg
  vim.g.terminal_color_15 = onenord.fg_light

  -- colors
  vim.g.terminal_color_1 = onenord.red
  vim.g.terminal_color_9 = onenord.red

  vim.g.terminal_color_2 = onenord.green
  vim.g.terminal_color_10 = onenord.green

  vim.g.terminal_color_3 = onenord.yellow
  vim.g.terminal_color_11 = onenord.yellow

  vim.g.terminal_color_4 = onenord.blue
  vim.g.terminal_color_12 = onenord.blue

  vim.g.terminal_color_5 = onenord.purple
  vim.g.terminal_color_13 = onenord.purple

  vim.g.terminal_color_6 = onenord.cyan
  vim.g.terminal_color_14 = onenord.cyan
end

function theme.load_treesitter()
  -- TreeSitter highlight groups

  local treesitter = {
    -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    TSAttribute = { fg = onenord.purple },
    -- Boolean literals: `True` and `False` in Python.
    TSBoolean = { fg = onenord.orange },
    -- Character literals: `'a'` in C.
    TSCharacter = { fg = onenord.green },
    -- Line comments and block comments.
    TSComment = { fg = onenord.light_gray },
    -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    TSConditional = { fg = onenord.purple },
    -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSConstant = { fg = onenord.orange },
    -- Built-in constant values: `nil` in Lua.
    TSConstBuiltin = { fg = onenord.light_orange },
    -- Constants defined by macros: `NULL` in C.
    TSConstMacro = { fg = onenord.orange },
    -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSConstructor = { fg = onenord.yellow },
    -- Syntax/parser errors. This might highlight large sections of code while the user is typing
    -- still incomplete code, use a sensible highlight.
    TSError = { fg = onenord.error },
    -- Exception related keywords: `try`, `except`, `finally` in Python.
    TSException = { fg = onenord.purple },
    -- Object and struct fields.
    TSField = { fg = onenord.blue },
    -- Floating-point number literals.
    TSFloat = { fg = onenord.orange },
    -- Function calls and definitions.
    TSFunction = { fg = onenord.blue },
    -- Built-in functions: `print` in Lua.
    TSFuncBuiltin = { fg = onenord.dark_blue },
    -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    TSFuncMacro = { fg = onenord.red },
    -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSInclude = { fg = onenord.blue },
    -- Keywords that don't fit into other categories.
    TSKeyword = { fg = onenord.purple },
    -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    TSKeywordFunction = { fg = onenord.purple },
    -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordOperator = { fg = onenord.light_gray },
    -- Keywords like `return` and `yield`.
    TSKeywordReturn = { fg = onenord.purple },
    -- GOTO labels: `label:` in C, and `::label::` in Lua.
    TSLabel = { fg = onenord.blue },
    -- Method calls and definitions.
    TSMethod = { fg = onenord.blue },
    -- Identifiers referring to modules and namespaces.
    TSNamespace = { fg = onenord.blue },
    -- Numeric literals that don't fit into other categories.
    TSNumber = { fg = onenord.orange },
    -- Binary or unary operators: `+`, and also `->` and `*` in C.
    TSOperator = { fg = onenord.light_gray },
    -- Parameters of a function.
    TSParameter = { fg = onenord.orange },
    -- References to parameters of a function.
    TSParameterReference = { fg = onenord.orange },
    -- Same as `TSField`.
    TSProperty = { fg = onenord.green },
    -- Differentiates between string and properties
    tomlTSProperty = { fg = onenord.blue }, -- Differentiates between string and properties
    -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctDelimiter = { fg = onenord.light_gray },
    -- Brackets, braces, parentheses, etc.
    TSPunctBracket = { fg = onenord.light_gray },
    -- Special punctuation that doesn't fit into the previous categories.
    TSPunctSpecial = { fg = onenord.white },
    -- Keywords related to loops: `for`, `while`, etc.
    TSRepeat = { fg = onenord.purple },
    -- String literals.
    TSString = { fg = onenord.green },
    -- Regular expression literals.
    TSStringRegex = { fg = onenord.blue },
    -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringEscape = { fg = onenord.purple },
    -- Identifiers referring to symbols or atoms.
    TSSymbol = { fg = onenord.cyan },
    -- Tags like HTML tag names.
    TSTag = { fg = onenord.yellow },
    -- HTML tag attributes.
    TSTagAttribute = { fg = onenord.blue },
    -- Tag delimiters like `<` `>` `/`.
    TSTagDelimiter = { fg = onenord.dark_blue },
    -- Non-structured text. Like text in a markup language.
    TSText = { fg = onenord.fg },
    -- Text to be represented in bold.
    TSStrong = { style = "bold" },
    -- Text to be represented with emphasis.
    TSEmphasis = { style = "italic" },
    -- Text to be represented with an underline.
    TSUnderline = { style = "underline" },
    -- Text that is part of a title.
    TSTitle = { fg = onenord.dark_blue, style = "bold" },
    -- Literal or verbatim text.
    TSLiteral = { fg = onenord.green },
    -- URIs like hyperlinks or email addresses.
    TSURI = { fg = onenord.green, style = "underline" },
    -- Math environments like LaTeX's `$ ... $`
    TSMath = { fg = onenord.purple },
    -- Footnotes, text references, citations, etc.
    TSTextReference = { fg = onenord.blue },
    -- Text environments of markup languages.
    TSEnvironment = { fg = onenord.fg },
    -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    TSEnvironmentName = { fg = onenord.yellow },
    -- Text representation of an informational note.
    TSNote = { fg = onenord.bg, bg=onenord.info },
    -- Text representation of a warning note.
    TSWarning = { fg = onenord.bg, bg=onenord.warn },
    -- Text representation of a danger note.
    TSDanger = { fg = onenord.bg, bg=onenord.error },
    -- Type (and class) definitions and annotations.
    TSType = { fg = onenord.yellow },
    -- Built-in types: `i32` in Rust.
    TSTypeBuiltin = { fg = onenord.blue },
    -- Variable names that don't fit into other categories.
    TSVariable = { fg = onenord.white },
    -- Variable names defined by the language: `this` or `self` in Javascript.
    TSVariableBuiltin = { fg = onenord.red },
  }

  -- Options:

  if config.italics.comments then
    italicize(treesitter.TSComment)
  end

  if config.italics.strings then
    italicize(treesitter.TSString)
  end

  if config.italics.keywords then
    italicize(treesitter.TSConditional)
    italicize(treesitter.TSKeyword)
    italicize(treesitter.TSRepeat)
    italicize(treesitter.TSKeywordFunction)
  end

  if config.italics.functions then
    italicize(treesitter.TSFunction)
    italicize(treesitter.TSMethod)
    italicize(treesitter.TSFuncBuiltin)
  end

  if config.italics.variables then
    italicize(treesitter.TSVariable)
    italicize(treesitter.TSVariableBuiltin)
  end

  return treesitter
end

function theme.load_lsp()
  -- Lsp highlight groups

  local lsp = {
    -- used for "Error" diagnostic virtual text
    LspDiagnosticsDefaultError = { fg = onenord.error },
    -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsSignError = { fg = onenord.error },
    -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingError = { fg = onenord.error },
    -- Virtual text "Error"
    LspDiagnosticsVirtualTextError = { fg = onenord.error },
    -- used to underline "Error" diagnostics.
    LspDiagnosticsUnderlineError = { style = "underline", sp = onenord.error },
    -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsDefaultWarning = { fg = onenord.warn },
    -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { fg = onenord.warn },
    -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingWarning = { fg = onenord.warn },
    -- Virtual text "Warning"
    LspDiagnosticsVirtualTextWarning = { fg = onenord.warn },
    -- used to underline "Warning" diagnostics.
    LspDiagnosticsUnderlineWarning = { style = "underline", sp = onenord.warn },
    -- used for "Information" diagnostic virtual text
    LspDiagnosticsDefaultInformation = { fg = onenord.info },
    -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsSignInformation = { fg = onenord.info },
    -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingInformation = { fg = onenord.info },
    -- Virtual text "Information"
    LspDiagnosticsVirtualTextInformation = { fg = onenord.info },
    -- used to underline "Information" diagnostics.
    LspDiagnosticsUnderlineInformation = { style = "underline", sp = onenord.info },
    -- used for "Hint" diagnostic virtual text
    LspDiagnosticsDefaultHint = { fg = onenord.hint },
    -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsSignHint = { fg = onenord.hint },
    -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsFloatingHint = { fg = onenord.hint },
    -- Virtual text "Hint"
    LspDiagnosticsVirtualTextHint = { fg = onenord.hint },
    -- used to underline "Hint" diagnostics.
    LspDiagnosticsUnderlineHint = { style = "underline", sp = onenord.hint },
    -- used for highlighting "text" references
    -- LspReferenceText = { style = "underline", sp = onenord.yellow },
    LspReferenceText = { bg = onenord.highlight },
    -- used for highlighting "read" references
    LspReferenceRead = { bg = onenord.highlight },
    -- used for highlighting "write" references
    LspReferenceWrite = { bg = onenord.highlight },

    DiagnosticError = { link = "LspDiagnosticsDefaultError" },
    DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
    DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
    DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
    DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
    DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
    DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
    DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
    DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
    DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
    DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
    DiagnosticSignError = { link = "LspDiagnosticsSignError" },
    DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
    DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
    DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
    DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
    DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
    DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
    DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
    DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
  }

  return lsp
end

function theme.load_plugins()
  -- Plugins highlight groups

  local plugins = {

    -- Cmp
    CmpItemAbbr = { fg = onenord.fg },
    CmpItemAbbrDeprecated = { fg = onenord.fg },
    CmpItemAbbrMatch = { fg = onenord.blue, style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = onenord.blue, underline = true },
    CmpItemMenu = { fg = onenord.light_gray },
    CmpItemKindText = { fg = onenord.green },
    CmpItemKindMethod = { fg = onenord.blue },
    CmpItemKindFunction = { fg = onenord.blue },
    CmpItemKindConstructor = { fg = onenord.yellow },
    CmpItemKindField = { fg = onenord.blue },
    CmpItemKindClass = { fg = onenord.yellow },
    CmpItemKindInterface = { fg = onenord.yellow },
    CmpItemKindModule = { fg = onenord.blue },
    CmpItemKindProperty = { fg = onenord.blue },
    CmpItemKindValue = { fg = onenord.orange },
    CmpItemKindEnum = { fg = onenord.yellow },
    CmpItemKindKeyword = { fg = onenord.purple },
    CmpItemKindSnippet = { fg = onenord.orange },
    CmpItemKindFile = { fg = onenord.blue },
    CmpItemKindEnumMember = { fg = onenord.cyan },
    CmpItemKindConstant = { fg = onenord.orange },
    CmpItemKindStruct = { fg = onenord.yellow },
    CmpItemKindTypeParameter = { fg = onenord.yellow },

    -- Notify
    NotifyERRORBorder = { fg = onenord.error },
    NotifyWARNBorder = { fg = onenord.warn },
    NotifyINFOBorder = { fg = onenord.info },
    NotifyDEBUGBorder = { fg = onenord.light_gray },
    NotifyTRACEBorder = { fg = onenord.hint },
    NotifyERRORIcon = { fg = onenord.error },
    NotifyWARNIcon = { fg = onenord.warn },
    NotifyINFOIcon = { fg = onenord.info },
    NotifyDEBUGIcon = { fg = onenord.light_gray },
    NotifyTRACEIcon = { fg = onenord.hint },
    NotifyERRORTitle = { fg = onenord.error },
    NotifyWARNTitle = { fg = onenord.warn },
    NotifyINFOTitle = { fg = onenord.info },
    NotifyDEBUGTitle = { fg = onenord.light_gray },
    NotifyTRACETitle = { fg = onenord.hint },

    -- Trouble
    TroubleCount = { fg = onenord.purple },
    TroubleNormal = { fg = onenord.fg },
    TroubleText = { fg = onenord.fg },

    -- Diff
    diffAdded = { fg = onenord.diff_add },
    diffRemoved = { fg = onenord.diff_remove },
    diffChanged = { fg = onenord.diff_change },
    diffOldFile = { fg = onenord.yellow },
    diffNewFile = { fg = onenord.orange },
    diffFile = { fg = onenord.blue },
    diffLine = { fg = onenord.light_gray },
    diffIndexLine = { fg = onenord.purple },

    -- Neogit
    NeogitBranch = { fg = onenord.blue },
    NeogitRemote = { fg = onenord.purple },
    NeogitHunkHeader = { fg = onenord.fg, bg = onenord.highlight },
    NeogitHunkHeaderHighlight = { fg = onenord.blue, bg = onenord.highlight },
    NeogitDiffContextHighlight = { bg = onenord.float },
    NeogitDiffDeleteHighlight = { fg = onenord.diff_remove, style = "reverse" },
    NeogitDiffAddHighlight = { fg = onenord.diff_add, style = "reverse" },

    -- GitGutter
    GitGutterAdd = { fg = onenord.diff_add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = onenord.diff_change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = onenord.diff_remove }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = onenord.diff_add }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr = { fg = onenord.diff_add }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn = { fg = onenord.diff_add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = onenord.diff_change }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = onenord.diff_change }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = onenord.diff_change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = onenord.diff_remove }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = onenord.diff_remove }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = onenord.diff_remove }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeNormal = { fg = onenord.fg, bg = onenord.bg },
    TelescopePromptPrefix = { fg = onenord.green },
    TelescopePromptBorder = { fg = onenord.blue },
    TelescopeResultsBorder = { fg = onenord.blue },
    TelescopePreviewBorder = { fg = onenord.blue },
    TelescopeSelectionCaret = { fg = onenord.dark_blue },
    TelescopeSelection = { fg = onenord.dark_blue },
    TelescopeMatching = { fg = onenord.yellow },

    -- NvimTree
    NvimTreeRootFolder = { fg = onenord.green, style = "bold" },
    NvimTreeFolderName = { fg = onenord.blue },
    NvimTreeFolderIcon = { fg = onenord.dark_blue },
    NvimTreeEmptyFolderName = { fg = onenord.blue },
    NvimTreeOpenedFolderName = { fg = onenord.yellow },
    NvimTreeIndentMarker = { fg = onenord.blue },
    NvimTreeGitDirty = { fg = onenord.yellow },
    NvimTreeGitNew = { fg = onenord.green },
    NvimTreeGitStaged = { fg = onenord.purple },
    NvimTreeGitDeleted = { fg = onenord.red },
    NvimTreeSpecialFile = { fg = onenord.orange, style = "underline" },
    NvimTreeNormal = { fg = onenord.fg, bg = onenord.active },
    NvimTreeCursorLine = { bg = onenord.float },
    NvimTreeVertSplit = { fg = onenord.active, bg = onenord.active },
    LspDiagnosticsError = { fg = onenord.error },
    LspDiagnosticsWarning = { fg = onenord.warn },
    LspDiagnosticsInformation = { fg = onenord.info },
    LspDiagnosticsHint = { fg = onenord.hint },

    -- WhichKey
    WhichKey = { fg = onenord.purple, style = "bold" },
    WhichKeyGroup = { fg = onenord.green },
    WhichKeyDesc = { fg = onenord.blue, style = "italic" },
    WhichKeySeperator = { fg = onenord.green },
    WhichKeyFloat = { bg = onenord.active },

    -- LspSaga
    LspFloatWinNormal = { fg = onenord.fg, bg = onenord.bg },
    LspFloatWinBorder = { fg = onenord.light_gray },
    DiagnosticError = { fg = onenord.error },
    DiagnosticWarning = { fg = onenord.warn },
    DiagnosticInformation = { fg = onenord.info },
    DiagnosticHint = { fg = onenord.hint },
    LspSagaDiagnosticBorder = { fg = onenord.gray },
    LspSagaDiagnosticHeader = { fg = onenord.blue },
    LspSagaDiagnosticTruncateLine = { fg = onenord.highlight },
    ProviderTruncateLine = { fg = onenord.highlight },
    LspSagaShTruncateLine = { fg = onenord.highlight },
    LspSagaDocTruncateLine = { fg = onenord.highlight },
    LineDiagTruncateLine = { fg = onenord.highlight },
    LspSagaBorderTitle = { fg = onenord.light_gray },
    LspSagaHoverBorder = { fg = onenord.blue },
    LspSagaRenameBorder = { fg = onenord.green },
    LspSagaDefPreviewBorder = { fg = onenord.green },
    LspSagaCodeActionTitle = { fg = onenord.blue },
    LspSagaCodeActionContent = { fg = onenord.purple },
    LspSagaCodeActionBorder = { fg = onenord.blue },
    LspSagaCodeActionTruncateLine = { fg = onenord.highlight },
    LspSagaSignatureHelpBorder = { fg = onenord.light_red },
    LspSagaFinderSelection = { fg = onenord.green },
    LspSagaAutoPreview = { fg = onenord.red },
    ReferencesCount = { fg = onenord.purple },
    DefinitionCount = { fg = onenord.purple },
    DefinitionPreviewTitle = { fg = onenord.green },
    DefinitionIcon = { fg = onenord.blue },
    ReferencesIcon = { fg = onenord.blue },
    TargetWord = { fg = onenord.cyan },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = onenord.yellow },
    BufferLineFill = { bg = onenord.bg },

    -- barbar
    BufferCurrent = { fg = onenord.bg, bg = onenord.light_gray },
    BufferCurrentIndex = { fg = onenord.bg, bg = onenord.light_gray },
    BufferCurrentMod = { fg = onenord.white, bg = onenord.light_gray },
    BufferCurrentSign = { fg = onenord.light_gray, bg = onenord.light_gray },
    BufferCurrentTarget = { fg = onenord.red, bg = onenord.light_gray, style = "bold" },
    BufferVisible = { fg = onenord.fg, bg = onenord.bg },
    BufferVisibleIndex = { fg = onenord.fg, bg = onenord.bg },
    BufferVisibleMod = { fg = onenord.yellow, bg = onenord.bg, style = "bold" },
    BufferVisibleSign = { fg = onenord.light_gray, bg = onenord.bg },
    BufferVisibleTarget = { fg = onenord.red, bg = onenord.bg, style = "bold" },
    BufferInactive = { fg = onenord.light_gray, bg = onenord.bg },
    BufferInactiveIndex = { fg = onenord.light_gray, bg = onenord.bg },
    BufferInactiveMod = { fg = onenord.yellow, bg = onenord.bg },
    BufferInactiveSign = { fg = onenord.light_gray, bg = onenord.bg },
    BufferInactiveTarget = { fg = onenord.red, bg = onenord.bg, style = "bold" },

    -- Sneak
    Sneak = { fg = onenord.bg, bg = onenord.fg },
    SneakScope = { bg = onenord.selection },

    -- Indent Blankline
    IndentBlanklineChar = { fg = onenord.selection, style = "nocombine" },
    IndentBlanklineContextChar = { fg = onenord.purple, style = "nocombine" },

    -- Nvim dap
    DapBreakpoint = { fg = onenord.red },
    DapStopped = { fg = onenord.green },

    -- Illuminate
    illuminatedWord = { bg = onenord.highlight },
    illuminatedCurWord = { bg = onenord.highlight },

    -- Hop
    HopNextKey = { fg = onenord.fg_light, style = "bold" },
    HopNextKey1 = { fg = onenord.cyan, style = "bold" },
    HopNextKey2 = { fg = onenord.purple },
    HopUnmatched = { fg = onenord.light_gray },

    -- Fern
    FernBranchText = { fg = onenord.blue },

    -- Lightspeed
    LightspeedLabel = { fg = onenord.purple, style = "bold,underline" },
    LightspeedLabelOverlapped = { fg = onenord.dark_purple, style = "underline" },
    LightspeedLabelDistant = { fg = onenord.cyan, style = "bold,underline" },
    LightspeedLabelDistantOverlapped = { fg = onenord.blue, style = "underline" },
    LightspeedShortcut = { fg = onenord.fg_light, bg = onenord.purple, style = "bold,underline" },
    LightspeedMaskedChar = { fg = onenord.magenta },
    LightspeedGreyWash = { fg = onenord.gray },
    LightspeedUnlabeledMatch = { fg = onenord.fg_light, style = "bold" },
    LightspeedOneCharMatch = { fg = onenord.yellow, style = "bold,reverse" },

    -- Toggleterm
    ToggleTerm = { fg = onenord.fg, bg = onenord.active },
    ToggleTermBorder = { fg = onenord.blue, bg = onenord.active },

    -- telekasten
    tklink = { fg = onenord.dark_green, style = "bold" },
    tkBrackets = { fg = onenord.light_gray },
    tkTagSep = { fg = onenord.dark_blue },
    tkTag = { fg = onenord.bg, bg = onenord.light_gray, style = "bold" },
    tkHighlight = { fg = onenord.bg, bg = onenord.blue, },
  }

  -- Options:

  -- Disable nvim-tree background
  if config.disable.background then
    remove_background(plugins.NvimTreeNormal)
  end

  return plugins
end

function theme.load_terminal()
  -- dark
  vim.g.terminal_color_0 = onenord.float
  vim.g.terminal_color_8 = onenord.selection

  -- light
  vim.g.terminal_color_7 = onenord.fg
  vim.g.terminal_color_15 = onenord.fg_light

  -- colors
  vim.g.terminal_color_1 = onenord.red
  vim.g.terminal_color_9 = onenord.red

  vim.g.terminal_color_2 = onenord.green
  vim.g.terminal_color_10 = onenord.green

  vim.g.terminal_color_3 = onenord.yellow
  vim.g.terminal_color_11 = onenord.yellow

  vim.g.terminal_color_4 = onenord.blue
  vim.g.terminal_color_12 = onenord.blue

  vim.g.terminal_color_5 = onenord.purple
  vim.g.terminal_color_13 = onenord.purple

  vim.g.terminal_color_6 = onenord.cyan
  vim.g.terminal_color_14 = onenord.cyan
end

function theme.highlights()
  return vim.tbl_deep_extend(
    "error",
    load_syntax(config),
    load_editor(config),
    load_treesitter(config),
    load_lsp(),
    load_plugins(config)
  )
end

return theme
