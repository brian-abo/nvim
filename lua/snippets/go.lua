local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Function template
  s("fn", fmt("func {}({}) {} {{\n\t{}\n}}", {
    i(1, "name"),
    i(2),
    i(3),
    i(0),
  })),

  -- Error check
  s("ife", {
    t({ "if err != nil {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Goroutine
  s("go", {
    t({ "go func() {", "\t" }),
    i(0),
    t({ "", "}()" }),
  }),
}

