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

newautosnip(
	"mm",
	fmt(
		[[
            $ <> $<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"dd",
	fmt(
		[[
		\[
			<>
		\]
		<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"frac",
	fmt(
		[[
			\frac{<>}{<>}<>
        ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"sum",
	fmt(
		[[
			\sum_{<>}^{<>}<>
        ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"in",
	fmta(
		[[
            \in <>
        ]],
		{ i(0) },
		{ delimiters = "<>"}
	),
	{ condition = in_mathzone }
)

newsnip(
	"set",
	fmt(
		[[
        	\{<>\} <>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"ge",
	fmt(
		[[
            \ge <>
        ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"le",
	fmt(
		[[
              \le <>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newautosnip(
	{ trig = "__", wordTrig = false },
	fmt(
		[[
              _{<>}<>
          ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newautosnip(
	{ trig = "^^", wordTrig = false },
	fmt(
		[[
			^{<>}<>
          ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	{ trig = "ff" },
	fmt(
		[[
              \frac{<>}{<>}<>
          ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"tilde",
	fmt(
		[[
			  \tilde{<>}<>
          ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"sset",
	fmt(
		[[
              \subset <>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"ci",
	fmt(
		[[
            \circ<>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"st",
	fmt(
		[[
            ,\ <>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"to",
	fmt(
		[[
              \to <>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
	"xx",
	fmt(
		[[
              \times <>
          ]],
		{ i(0) },
		{ delimiters = "<>" }
	),
	{ condition = in_mathzone }
)

newsnip(
    "al",
    fmt(
        [[
            \alpha<>
        ]],
        { i(0) },
        { delimiters = "<>" }
    )
)

newsnip(
    "be",
    fmt(
        [[
            \beta<>
        ]],
        { i(0) },
        { delimiters = "<>" }
    )
)

newsnip(
    "cap",
    fmt(
        [[
            \cap
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "sseteq",
    fmt(
        [[
            \subseteq
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "bigc",
    fmt(
        [[
            \bigcup
        ]],
        {  },
        { delimiters = "<>" }
    )
)




newsnip(
    "rr",
    fmt(
        [[
            \R
        ]],
        { },
        { delimiters = "<>" }
    )
)

newsnip(
    "lr",
    fmt(
        [[
            \left<>\right
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

newsnip(
    "min",
    fmt(
        [[
            \min
        ]],
        { },
        { delimiters = "<>" }
    )
)

newsnip(
    "max",
    fmt(
        [[
            \max
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "nu",
    fmt(
        [[
            \nu
        ]],
        {  },
        { delimiters = "<>" }
    )
)

newsnip(
    "emp",
    fmt(
        [[
            \emph{<>}
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

---End---

return snippets, autosnippets
