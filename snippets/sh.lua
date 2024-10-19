local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
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
	"test",
	fmt(
		[[
            [ <> ]<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"fun",
	fmt(
		[[
            <>() {
				<>
			}
        ]],
		{ i(1, "fname"), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"nargs",
	fmt(
		[[
            if [ $# -ne <> ]; then
				echo "Usage: $0 <>"
				exit <>
			fi
			<>
        ]],
		{ i(1, "nargs"), i(2, "usage"), i(3, "exit_code"), i(0) },
		{ delimiters = "<>" }
	)
)

---End---

return snippets, autosnippets
