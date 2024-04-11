return {
  "L3MON4D3/LuaSnip",
  config = function()
    local snip = require("luasnip")
    local s = snip.snippet
    local t = snip.text_node
    local i = snip.insert_node

    snip.add_snippets("lua", {
      s("hello", {
        t('print("Hello, world!")')
      })
    })
  end
}
