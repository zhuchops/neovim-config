return {
  'neovim/nvim-lspconfig',
  dependencies = { 
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()

    require("mason").setup()

    local servers = {
      lua_ls = {
        settings = {
	        Lua = {
	          diagnostic = { globals = { "vim" } },
          },
        },
      },
      gopls = {},
    }

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    for server, config in pairs(servers) do
      -- 1. Сливаем capabilities от blink.cmp
      -- Это критически важно для работы автодополнения
      config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 2. Настраиваем сервер (Native Nvim 0.11+)
      -- Эта функция обновляет конфигурацию в реестре Neovim, 
      -- сливая её с дефолтными настройками из плагина nvim-lspconfig.
      vim.lsp.config(server, config)
      
      -- 3. Включаем сервер
      -- Это активирует сервер глобально для всех подходящих filetypes.
      vim.lsp.enable(server)
      end
  end
}
