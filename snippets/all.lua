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
local newautosnip = function(trig, nodes, opts)
	table.insert(autosnippets, s(trig, nodes, opts))
end

newsnip(
	"ns",
	fmt(
		[=[
      newsnip(
          "-;",
          fmt(
              [[
                  -;
              ]],
              { -; },
              { delimiters = "<>" }
          )
      )
    ]=],
		{ i(1, "trig"), i(2), i(3, "nodes") },
		{ delimiters = "-;" }
	)
)

newsnip(
	"nas",
	fmt(
		[=[
      newautosnip(
          "-;",
          fmt(
              [[
                  -;
              ]],
              { -; },
              {delimiters = "<>" }
          )
      )
    ]=],
		{ i(1, "trig"), i(2), i(3, "nodes") },
		{ delimiters = "-;" }
	)
)

-- newsnip(
-- 	"i",
-- 	fmt(
-- 		[[
--       i(<>, "<>")
--     ]],
-- 		{ i(1, "n"), i(2, "desc") },
-- 		{ delimiters = "<>" }
-- 	)
-- )
--
-- newsnip(
-- 	"(",
-- 	fmt(
-- 		[[
--       (<>)<>
--     ]],
-- 		{ i(1), i(0) },
-- 		{ delimiters = "<>" }
-- 	)
-- )
--
-- newsnip(
-- 	'"',
-- 	fmt(
-- 		[[
--       "<>"<>
--     ]],
-- 		{ i(1), i(0) },
-- 		{ delimiters = "<>" }
-- 	)
-- )

---End---

return snippets
