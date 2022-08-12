local lexers = vis.lexers

local colors = {
	['foreground']       = '#000000',
	['background']       = '#EDEDED',

	['red']              = '#df0000', -- Include/Exception
	['green']            = '#00aa00', -- Boolean/Special
	['blue']             = '#4271ff', -- Keyword

	['pink']             = '#d7005f', -- Type
	['olive']            = '#718c00', -- String
	['lightgreen']       = '#55aa55', -- StorageClass

	['orange']           = '#d75f00', -- Number
	['purple']           = '#8959a8', -- Repeat/Conditional
	['aqua']             = '#3e999f', -- Operator/Delimiter

	['magenta']          = '#d33682',
	['violet']           = '#6c71c4',
	['cyan']             = '#2aff98',

	['selection']        = '#bcbcbc',
	['base02']           = '#073642',
	['comment']          = '#878787',

	['cursorline']       = '#d3d7cf',
	['cursorbackground'] = 'black',
	['cursorforeground'] = 'white',
}

lexers.colors = colors
-- light
local fg = 'fore:'..colors.foreground
local bg = 'back:'..colors.background

-- use background color of terminal instead of defining it here
lexers.STYLE_DEFAULT        = ''
lexers.STYLE_NOTHING        = ''
lexers.STYLE_CLASS          = 'fore:'..colors.lightgreen
lexers.STYLE_COMMENT        = 'fore:'..colors.comment
lexers.STYLE_CONSTANT       = 'fore:'..colors.orange
lexers.STYLE_DEFINITION     = 'fore:'..colors.blue
lexers.STYLE_ERROR          = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION       = 'fore:'..colors.blue
lexers.STYLE_KEYWORD        = 'fore:'..colors.lightgreen..',normal'
lexers.STYLE_LABEL          = 'fore:'..colors.blue
lexers.STYLE_NUMBER         = 'fore:'..colors.orange
lexers.STYLE_OPERATOR       = 'fore:'..colors.aqua
lexers.STYLE_REGEX          = 'fore:'..colors.olive
lexers.STYLE_STRING         = 'fore:'..colors.aqua
lexers.STYLE_PREPROCESSOR   = 'fore:'..colors.red
lexers.STYLE_TAG            = 'fore:'..colors.green
lexers.STYLE_TYPE           = 'fore:'..colors.pink..',normal'
lexers.STYLE_VARIABLE       = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE     = ''
lexers.STYLE_EMBEDDED       = 'fore:'..colors.blue
lexers.STYLE_IDENTIFIER     = ''

lexers.STYLE_CURSOR         = 'fore:'..colors.cursorforeground..',back:'..colors.cursorbackground
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:'..colors.magenta
lexers.STYLE_CURSOR_LINE    = ''
lexers.STYLE_COLOR_COLUMN   = 'back:'..colors.cursorline
lexers.STYLE_SELECTION      = 'back:'..colors.selection
lexers.STYLE_CURSOR_LINE    = 'back:'..colors.cursorline
lexers.STYLE_STATUS         = 'reverse'
lexers.STYLE_STATUS_FOCUSED = 'reverse,bold'
lexers.STYLE_SEPARATOR      = lexers.STYLE_DEFAULT
lexers.STYLE_INFO           = 'fore:default,back:default,bold'
lexers.STYLE_EOF            = ''
