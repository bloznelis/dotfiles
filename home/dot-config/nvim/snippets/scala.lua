local ls = require("luasnip")

return {
        ls.parser.parse_snippet({trig = "for-comp"}, [[
for
  $1 <- $2
yield ()
]])
}
