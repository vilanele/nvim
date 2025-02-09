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
    "kp",
    fmt(
        [[
            \PolyhedralAlgebra
        ]],
        {},
        { delimiters = "<>" }
    )
)


newsnip(
    "lam",
    fmt(
        [[
            \LaurentMonoid
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "pom",
    fmt(
        [[
            \PositiveMonoid
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "cod",
    fmt(
        [[
            (T_i)_{i \in I}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "val",
    fmt(
        [[
            \val
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "tal",
    fmt(
        [[
            \TateAlgebra
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "Kbar",
    fmt(
        [[
            \Kbar
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "pal",
    fmt(
        [[
            \PolyhedralAlgebra
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "tall",
    fmt(
        [[
            \TateAlgebraLogRadii
        ]],
        { },
        { delimiters = "<>" }
    )
)

newsnip(
    "vi",
    fmt(
        [[
            V_i
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "vii",
    fmt(
        [[
            V_{i,<}
        ]],
        { },
        { delimiters = "[]" }
    )
)

newsnip(
    "viif",
    fmt(
        [[
            V_{i,<}(f)
        ]],
        {  },
        { delimiters = "[]" }
    )
)

newsnip(
    "lmi",
    fmt(
        [[
            \lm^{i}
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "lmif",
    fmt(
        [[
            \lm^{i}(f)
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "lmig",
    fmt(
        [[
            \lm^{i}(g)
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "Lm",
    fmt(
        [[
            \LM
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "Lmi",
    fmt(
        [[
            \LM^{i}
        ]],
        {  },
        { delimiters = "[]" }
    )
)

newsnip(
    "Lmif",
    fmt(
        [[
         	\LM^{i}(f)   
        ]],
        { },
        { delimiters = "[]" }
    )
)

newsnip(
    "Lmig",
    fmt(
        [[
            \LM^{i}(g)
        ]],
        { },
        { delimiters = "[]" }
    )
)

---End---

return snippets, autosnippets
