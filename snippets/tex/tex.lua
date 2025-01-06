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
	"beg",
	fmt(
		[[
      \begin{<>}
        <>
      \end{<>}

      <>
    ]],
		{ i(1, "env"), i(2), rep(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"sec",
	fmt(
		[[
            \section{<>}<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"ref",
	fmt(
		[[
            \ref{<>}<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"cite",
	fmt(
		[[
			\cite{<>}<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"up",
	fmt(
		[[
			\usepackage{<>}<>
        ]],
		{ i(1), i(0) },
		{ delimiters = "<>" }
	)
)

newsnip(
	"it",
	fmt(
		[[
        \item <>
        ]],
		{ i(0) },
		{ delimiters = "<>" }
	)
)


newsnip(
    "nc",
    fmt(
        [[
            \newcommand{<>}{<>}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)

newsnip(
    "la",
    fmt(
        [[
            \label{<>}
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

newsnip(
    "def",
    fmt(
        [[
			\begin{definition}
			\label{def:<>}
				<>
			\end{definition}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)


newsnip(
    "lem",
    fmt(
        [[
			\begin{lemma}
			\label{lem:<>}
				<>
			\end{lemma}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)



newsnip(
    "theo",
    fmt(
        [[
			\begin{theorem}
			\label{th:<>}
				<>
			\end{theorem}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)

newsnip(
    "pro",
    fmt(
        [[
            \begin{proof}
			\label{pr:<>}
				<>
			\end{proof}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)

newsnip(
    "ali",
    fmt(
        [[
			\begin{align}
			\label{eq:<>}
				<>
			\end{align}
        ]],
        { i(1), i(2) },
        { delimiters = "<>" }
    )
)


newsnip(
    "te",
    fmt(
        [[
            \text{<>}<>
        ]],
        { i(1), i(0) },
        { delimiters = "<>" }
    )
)

newsnip(
    "tn",
    fmt(
        [[
			\textnormal{<>}
        ]],
        { i(1) },
        { delimiters = "<>" }
    )
)

---End---

return snippets
