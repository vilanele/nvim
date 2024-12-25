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

newsnip(
	"frag",
	fmt(
		[[
		<Fragment>
			{}
		</Fragment>
        ]],
		{ i(1) },
		{ delimiters = "{}" }
	)
)

newsnip(
	"state",
	fmt(
		[[
		const [{}, set{}] = useState<{}>({});
		{}
        ]],
		{ i(1), rep(1), i(2), i(3, "null"), i(0) },
		{ delimiters = "{}" }
	)
)

newsnip(
	"ref",
	fmt(
		[[
		const {} = useRef<{}>({});
		{}
        ]],
		{ i(1), i(2), i(3), i(0) },
		{ delimiters = "{}" }
	)
)

newsnip(
	"int",
	fmt(
		[[
        interface <> {
			<>	
		}<>
        ]],
		{ i(1, "name"), i(2), i(0) },
		{ delimiters = "<>" }
	)
)

---End---

return snippets, autosnippets
