local lexers = vis.lexers

local colors = {
	['foreground']       = 'white',
	['background']       = '#181818',

	['red']              = '#ed4a46', -- Include/Exception
	['br_red']           = '#ff5e56',
	['green']            = '#70b433', -- Boolean/Special
	['blue']             = '#368aeb', -- Keyword

	['pink']             = '#ff81ca', -- Type
	['olive']            = '#83c746', -- String
	['lightgreen']       = '#83c746', -- StorageClass

	['orange']           = '#e67f43', -- Number
	['purple']           = '#a580e2', -- Repeat/Conditional
	['aqua']             = '#4f9cfe', -- Operator/Delimiter

	['magenta']          = '#eb6eb7',
	['violet']           = '#a580e2',
	['cyan']             = '#3fc5b7',

	['selection']        = '#bcbcbc',
	['base02']           = '#636363',
	['comment']          = '#878787',

	['cursorline']       = '#252525',
	['cursorbackground'] = 'white',
	['cursorforeground'] = 'black',
}

lexers.colors = colors
-- light
local fg = 'fore:'..colors.foreground
local bg = 'back:'..colors.background

-- use background color of terminal instead of defining it here
-- lexers.STYLE_DEFAULT        = fg
lexers.STYLE_DEFAULT        = fg..','..bg
lexers.STYLE_NOTHING        = ''
lexers.STYLE_CLASS          = 'fore:'..colors.lightgreen
lexers.STYLE_COMMENT        = 'fore:'..colors.comment
lexers.STYLE_CONSTANT       = 'fore:'..colors.orange
lexers.STYLE_DEFINITION     = 'fore:'..colors.blue
lexers.STYLE_ERROR          = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION       = 'fore:'..colors.violet
lexers.STYLE_KEYWORD        = 'fore:'..colors.green..',normal'
lexers.STYLE_LABEL          = 'fore:'..colors.blue
lexers.STYLE_NUMBER         = 'fore:'..colors.orange
lexers.STYLE_OPERATOR       = 'fore:'..colors.purple
lexers.STYLE_REGEX          = 'fore:'..colors.olive
lexers.STYLE_STRING         = 'fore:'..colors.aqua
lexers.STYLE_PREPROCESSOR   = 'fore:'..colors.br_red
lexers.STYLE_TAG            = 'fore:'..colors.lightgreen
lexers.STYLE_TYPE           = 'fore:'..colors.cyan..',normal'
lexers.STYLE_VARIABLE       = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE     = ''
lexers.STYLE_EMBEDDED       = 'fore:'..colors.blue
lexers.STYLE_IDENTIFIER     = fg

-- lexers.STYLE_LINENUMBER     = 'fore:'..colors.selection, 'back:'..colors.cursorline
lexers.STYLE_LINENUMBER_CURSOR = 'fore:white'
lexers.STYLE_CURSOR         = 'fore:'..colors.cursorforeground..',back:'..colors.cursorbackground
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:'..colors.magenta
lexers.STYLE_CURSOR_LINE    = 'back:'..colors.cursorline
lexers.STYLE_COLOR_COLUMN   = 'back:'..colors.cursorline
lexers.STYLE_SELECTION      = 'back:'..colors.selection
lexers.STYLE_STATUS         = 'reverse'
lexers.STYLE_STATUS_FOCUSED = 'reverse,bold'
lexers.STYLE_SEPARATOR      = lexers.STYLE_DEFAULT
lexers.STYLE_INFO           = 'fore:default,back:default,bold'
lexers.STYLE_EOF            = ''
