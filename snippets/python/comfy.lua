local ls         = require("luasnip")
local s          = ls.snippet
local sn         = ls.snippet_node
local t          = ls.text_node
local i          = ls.insert_node
local f          = ls.function_node
local d          = ls.dynamic_node
local c          = ls.choice_node
local fmt        = require("luasnip.extras.fmt").fmt
local fmta       = require("luasnip.extras.fmt").fmta
local rep        = require("luasnip.extras").rep

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local snippets   = {}

local newsnip    = function(trig, nodes, opts)
	table.insert(snippets, s(trig, nodes, opts))
end

local function input_nodes()
	return fmt(
		[["<>": ("<>", {"default": <>}),]],
		{ i(1, "name"), c(2, { t("INT"), t("STRING") }), i(3, "default") },
		{ delimiters = "<>" }
	)
end

newsnip(
	"in",
	fmt(
		[[
            <>
        ]],
		{ sn(1, input_nodes()) },
		{ delimiters = "<>" }
	)
)

newsnip(
	{ trig = "node" },
	fmt([[
		class <>:
			@classmethod
			def INPUT_TYPES(cls):
				return {
					"required": {
						<>
					}
				}

			RETURN_TYPES = ()
			RETURN_NAMES = ()
			CATEGORY = ""
			FUNCTION = "execute"

			def execute(self):
				pass
				
        ]],
		{
			i(1, "name"),
			i(0),
		},
		{ delimiters = "<>" }
	)
)

local function type_nodes()
	return { t([["INT"]]), t([["STRING"]]) }
end

newsnip(
	"type",
	fmt(
		[[
            <>
        ]],
		{ c(1, type_nodes()) },
		{ delimiters = "<>" }
	)
)

---End---

return snippets
