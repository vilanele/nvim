local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local snippets = {}
local autosnippets = {}

local newsnip = function(trig, nodes, opts)
	table.insert(snippets, s(trig, nodes, opts))
end

local newautosnip = function(trig, nodes, opts)
	table.insert(autosnippets, s(trig, nodes, opts))
end

local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

newsnip(
    "UU",
    fmt(
        [[
            \U
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "XX",
    fmt(
        [[
            \X
        ]],
        {  },
        { delimiters = "<>" }
    )
)


newsnip(
    "cal",
    fmt(
        [[
            c_{\alpha}\X^{\alpha}
        ]],
        { },
        { delimiters = "<>" }
    )
)

newsnip(
    "cbe",
    fmt(
        [[
            c_{\beta}\X^{\beta}
        ]],
        { },
        { delimiters = "<>" }
    )
)

newsnip(
    "vp",
    fmt(
        [[
            \valP(<>)
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

newsnip(
    "xal",
    fmt(
        [[
            \X^{\alpha}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "xbe",
    fmt(
        [[
            \X^{\beta}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "xga",
    fmt(
        [[
            \X^{\gamma}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "Ui",
    fmt(
        [[
            \U_i
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "Uib",
    fmt(
        [[
            \overline{\U_i}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "lm",
    fmt(
        [[
            \LM
        ]],
        {  },
        { delimiters = "<>" }
    )
)

---End---

return snippets, autosnippets
