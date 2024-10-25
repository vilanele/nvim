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

newsnip(
	"forl",
	fmt(
		[[
		for <> from <> to <> list <>
			<>
        ]],
		{ i(1), i(2), i(3), i(4), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"nc",
	fmt(
		[[
		# %%
		<>
        ]],
		{ i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"md",
	fmt(
		[[
        # %% [md]
		<>
        ]],
		{ i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"if",
	fmt(
		[[
		if <> then (
			<>
		) <>
        ]],
		{ i(1, "condition"), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"else",
	fmt(
		[[
		else (
			<>
		)<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"elif",
	fmt(
		[[
		else if <> then (
			<>
		) <>
        ]],
		{ i(1, "condition"), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"fun",
	fmt(
		[[
		{} = {} -> (
			{}
		)
		{}
        ]],
		{ i(1, "name"), i(2), i(3), i(0) },
		{ delimiters = "{}" }
	)
)

---End---

return snippets, autosnippets
