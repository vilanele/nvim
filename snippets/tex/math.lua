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

newautosnip(
	"in",
	fmta(
		[[
            \in <>
        ]],
		{ i(0) },
		{}
	),
	{ condition = in_mathzone }
)

newautosnip(
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

newautosnip(
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

newautosnip(
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

newautosnip(
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

newautosnip(
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

newautosnip(
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

newautosnip(
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

---End---

return snippets, autosnippets