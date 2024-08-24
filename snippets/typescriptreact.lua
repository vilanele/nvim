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

newautosnip(
	"vv",
	fmt(
		[[
      let <> = <>;
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"cc",
	fmt(
		[[
      const <> = <>;
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"bb",
	fmt(
		[[
      let <> = <>;
      <>
    ]],
		{ i(1), c(2, { t(""), t("true"), t("false") }), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"ss",
	fmt(
		[[
      let <> ="<>";
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"aa",
	fmt(
		[[
      let <> = [<>];
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"oo",
	fmt(
		[[
      let <> = {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"pp",
	fmt(
		[[
      <>: <>,
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newautosnip(
	"ff",
	fmt(
		[[
      let <> = function(<>){
          <>
      };
      <>
    ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"al",
	fmt(
		[[
      alert(<>)<>
    ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"co",
	fmt(
		[[
      confirm(<>)<>
    ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"pr",
	fmt(
		[[
      prompt(<>, <>)<>
    ]],
		{ i(1), c(2, { t(""), i(1, "default") }), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"if",
	fmt(
		[[
      if (<>) {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"el",
	fmt(
		[[
      else {
          <>
      }
      <>
    ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"eli",
	fmt(
		[[
      else if (<>) {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"ife",
	fmt(
		[[
      if (<>) {
          <>
      } else {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"??",
	fmt(
		[[
      (<>) ? <> : <>
    ]],
		{ i(1), i(2), i(3) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"wh",
	fmt(
		[[
      while (<>) {
          <>  
      }
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"dowh",
	fmt(
		[[
      do {
          <>
      } while (<>);
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"for",
	fmt(
		[[
      for (<>; <>; <>) {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(3), i(4), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"swi",
	fmt(
		[[
      switch(<>) {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"cas",
	fmt(
		[[
      case <>:
          <>
      break;
      <>
    ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"def",
	fmt(
		[[
      default:
          <>
    ]],
		{ i(1) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"fun",
	fmt(
		[[
      function <>(<>) {
          <>
      }
      <>
    ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"fune",
	fmt(
		[[
      function(<>){
          <>
      }
    ]],
		{ i(1), i(2) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"funa",
	fmt(
		[[
      ([]) => {
          []
      }
    ]],
		{ i(1), i(2) },
		{ delimiters = "[]" }
	)
)

newsnip(
	"forin",
	fmt(
		[[
            for (<> in <>) {
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"sym",
	fmt(
		[[
            Symbol(<>)
        ]],
		{ i(1) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"forof",
	fmt(
		[[
            for (<> of <>) {
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"cl",
	fmt(
		[[
            class <> {
                constructor (<>) {
                    <>
                }
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(3), i(4), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"cons",
	fmt(
		[[
            constructor (<>) {
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"met",
	fmt(
		[[
            <>(<>) {
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"try",
	fmt(
		[[
            try {
                <>
            } catch (err) {
                <>
            }
            <>
        ]],
		{ i(1), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"pro",
	fmt(
		[[
            new Promise(function(resolve, reject){
                <>
            })
        ]],
		{ i(1) },
		{ delimiters = "<>" }
	)
)

newsnip(
    "<>",
    fmt(
        [[
		<>
			{}
		</>
        ]],
        { i(1) },
        { delimiters = "{}" }
    )
)

newsnip(
    "nimp",
    fmt(
        [[
            import { <> }
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

newsnip(
    "imp",
    fmt(
        [[
            import { <> }
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

---End---

return snippets, autosnippets