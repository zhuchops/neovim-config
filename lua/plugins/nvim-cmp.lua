return {
 "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",             -- Движок сниппетов
    "saadparwaiz1/cmp_luasnip",     -- Источник сниппетов для cmp
    "hrsh7th/cmp-buffer",           -- Источник из буфера
    "hrsh7th/cmp-path",             -- Источник путей файлов
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- Вызвать меню вручную
        ["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), -- Enter для выбора
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" },  -- Сниппеты
      }, {
        { name = "buffer" },   -- Слова из текущего файла
        { name = "path" },     -- Пути к файлам
      }),
    })
  end,
}
