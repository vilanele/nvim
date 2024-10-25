" Vim syntax file for Singular

syntax match singularString /"\([^\\]\|\\.\)*\("|\n\)/

syntax keyword singularKeyword apply break breakpoint continue else export exportto for if importfrom keepring load quit return while
syntax keyword singularType bigint bigintmat def ideal int intmat intvec link list map matrix module number package poly proc resolution ring string vector User cone fan polytope pyobject reference shared
syntax keyword singularBuiltin align attrib bareiss betti char char_series charstr chinrem cleardenom close coef coeffs contract datetime dbprint defined deg degree delete denominator det diff dim division dump eliminate eval ERROR example execute extgcd facstd factmodd factorize farey fetch fglm fglmquot files find finduni fprintf freemodule frwalk gcd gen getdump groebner help highcorner hilb homog hres imap impart indepSet insert interpolation interred intersect jacob janet jet kbase kernel kill killattrib koszul laguerre lead leadcoef leadexp leadmonom LIB lift liftstd listvar lres ludecomp luinverse lusolve max maxideal memory min minbase minor minres modulo monitor monomial mpresmat mres mstd mult nameof names ncols npars nres nrows numerator nvars open option ord ordstr par pardeg parstr preimage prime primefactors print printf prune qhweight qrds quit quote quotient random rank read reduce regularity repart res reservedName resultant ringlist ring_list rvar sba setring simplex simplify size slimgb sortvec sqrfree sprintf sres status std stdfglm stdhilb subst system syz trace transpose type typeof univariate uressolve vandermonde var variables varstr vdim waitall waitfirst wedge weight weightKB write

syntax match singularNumber /0x[a-f\d]\+|\<[-+]\=\(\.\d\+\|\d\+\.?\d*\)\(e[-+]\=\d\+\)\=/
syntax match singularComment "//.*"
syntax region singularMultilineComment start="/\*" end="\*/" contains=singularComment
syntax match singularOperator /[-+/*=<>!]\+/

syntax match singularVariable /\<[a-z$][\w$]*\>/

highlight link singularString String
highlight link singularKeyword Keyword
highlight link singularType Type
highlight link singularBuiltin Function
highlight link singularNumber Number
highlight link singularComment Comment
highlight link singularOperator Operator
highlight link singularVariable Identifier
highlight link singularMultilineComment Comment

" Set filetype to singular

