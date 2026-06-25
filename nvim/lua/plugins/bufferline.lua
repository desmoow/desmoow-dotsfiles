require("bufferline").setup({
  options = {
    mode = "buffers",

    numbers = "none",

    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",

    diagnostics = "nvim_lsp",

    separator_style = "thin",

    show_buffer_close_icons = true,
    show_close_icon = false,

    always_show_bufferline = true,

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Tab>n", "<Cmd>enew<CR>", opts)
vim.keymap.set("n", "<Tab>c", "<Cmd>bdelete<CR>", opts)
vim.keymap.set("n", "<Tab>o", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<Tab>p", "<Cmd>BufferLineCycleNext<CR>", opts)
