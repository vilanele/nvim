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

local newsnip = function(trig, nodes, opts)
	table.insert(snippets, s(trig, nodes, opts))
end

newsnip(
	"oi",
	fmt(
		[[{}-> int]],
		{ t(" ") },
		{ delimiters = "{}" }
	)
)

newsnip(
	"ss",
	fmt(
		[[
            <>: str<>
        ]],
		{ i(1, "name"), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"ii",
	fmt(
		[[
            <>: int<>
        ]],
		{ i(1, "name"), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"def",
	fmt(
		[[
		def <>(<>)<>:
			<>
		<>
    ]],
		{ i(1, "fname"), i(2), i(3), i(4, "pass"), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"for",
	fmt(
		[[
      for <> in <>:
        <>
    ]],
		{ i(1, "name"), i(2, "iter"), i(3) },
		{ delimiters = "<>" }
	)
)


newsnip(
	"def",
	fmt(
		[[
      def <>(<>):
        <>
    ]],
		{ i(1, "fname"), i(2, "args"), i(3, "body") },
		{ delimiters = "<>" }
	)
)

newsnip(
	"cl",
	fmt(
		[[
      class <>(<>):
        <>
    ]],
		{ i(1, "cname"), i(2), i(3, "pass") },
		{ delimiters = "<>" }
	)
)

newsnip(
	"ini",
	fmt(
		[[
      def __init__(self<>):
        <>
    ]],
		{ i(1, ""), i(2, "pass") },
		{ delimiters = "<>" }
	)
)

newsnip(
	"sini",
	fmt(
		[[
      super().__init__(<>)
      <>
    ]],
		{ i(1, ""), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"met",
	fmt(
		[[
			def <>(self):
				<>
        ]],
		{ i(1, "name"), i(2, "body") },
		{ delimiters = "<>" }
	)
)

newsnip(
	"fr",
	fmt(
		[[
			from <> import <>
			<>
        ]],
		{ i(1, "module"), i(2, "symbols"), i(0) },
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

---End---

return snippets
