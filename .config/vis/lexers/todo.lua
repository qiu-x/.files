-- Copyright 2006-2017 Mitchell mitchell.att.foicica.com. See LICENSE.
-- Markdown LPeg lexer.

local l = require('lexer')
local token, word_match = l.token, l.word_match
local P, R, S = lpeg.P, lpeg.R, lpeg.S

local M = {_NAME = 'todo'}

-- Whitespace.
local ws = token(l.WHITESPACE, l.space^1)

-- Block elements.
local notdone = token('nd', l.starts_line('[ ]') * l.nonnewline^0) +

M._rules = {
  {'notdone', notdone},
}

local font_size = 10
local hstyle = 'fore:red'
M._tokenstyles = {
  nd = hstyle,
}

return M
