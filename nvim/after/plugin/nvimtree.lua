local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  view = {
    float = {
      enable = true,
      open_win_config = {
        width = math.floor(vim.o.columns * 0.8),
        height = vim.o.lines - 6,
        row = 2,
        col = math.floor(vim.o.columns * 0.1),
      }
    },
  },
  actions = { open_file = { quit_on_open = true } },
  filters = { dotfiles = false, custom = { "^.DS_Store$", "^\\.git$" } },
  git = { enable = true, ignore = false, timeout = 500 },
})
