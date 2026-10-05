local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvimtools/none-ls.nvim" },
        { "folke/todo-comments.nvim", dependency = { "nvim-lua/plenary.nvim" } },
        {
            "nvim-telescope/telescope.nvim", version = "*",
            dependencies = {
                "nvim-lua/plenary.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            }
        },
        { import = "plugins" },
    },
    checker = { enabled = true },
})

-- Colorscheme
vim.cmd.colorscheme("catppuccin-mocha")

-- Keybindings


-- Other settings
vim.opt.relativenumber = true
vim.opt.number = true

-- Lsp
vim.lsp.enable({ "lua-language-server", "jsonls", "ts_ls", "ty" })
vim.diagnostic.config({ virtual_text = true })
