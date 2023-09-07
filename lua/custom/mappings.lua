---@type MappingsTable
local M = {}

-- <C> -> Ctrl
-- <leader> -> Space
-- <A> -> alt
-- <S> -> shift
-- <M> -> meta (cmd key on mac)
-- <D> -> super (windows key on windows)
-- <kPoint> -> Keypad Point (.)
-- <kEqual> -> Keypad Equal (=)
-- <kPlus> -> Keypad Plus (+)
-- <kMinus> -> Keypad Minus (-)
-- <bs> -> Backspace
-- <tab> -> Tab

M.disabled = {
  n = {
    ["<leader>b"] = "",
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modesx
  n = {
    ["<A-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "  Toggle comment",
    },
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "  Toggle comment",
    },
  },

  v = {
    ["<A-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "  Toggle comment",
    },
  },
}

M.accelerated_jk = {
  n = {
    k = { "<Plug>(accelerated_jk_gk)", " Accelerated up movement" },
    j = { "<Plug>(accelerated_jk_gj)", " Accelerated down movement" },
  },
}

M.development = {
  n = {
    ["<leader>it"] = {
      function()
        require("nvim-toggler").toggle()
      end,
      "󰌁 Invert text",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      " Lsp formatting",
    },
    ["<leader>bi"] = {
      function()
        require("nvim-biscuits").toggle_biscuits()
      end,
      "󰆘 Toggle context",
    },
    ["<A-p>"] = { "<cmd>Colortils picker<CR>", " Delete word" },
  },
}

M.text = {
  i = {
    -- Move line up and down
    -- ["<C-Up>"] = { "<cmd> :m-2<CR>", "󰜸 Move line up" },
    ["<C-Up>"] = { "<cmd>m .-2<CR>==", "󰜸 Move line up" },

    -- ["<C-Down>"] = { "<cmd> :m+<CR>", "󰜯 Move line down" },
    ["<C-Down>"] = { "<cmd>m .+1<CR>==", "󰜯 Move line down" },

    -- Navigate
    ["<C-Left>"] = { "<ESC>I", " Move to beginning of line" },
    ["<C-Right>"] = { "<ESC>A", " Move to end of line" },
    ["<C-d>"] = { "<ESC>diw", " Delete word" },
    ["<S-CR>"] = {
      function()
        vim.cmd "normal o"
      end,
      " New line",
    },
  },

  n = {
    ["<leader>cc"] = { "<cmd> ColorcolumnToggle <CR>", " Toggle ColorColumn display" },
    -- Navigate

    ["<C-Left>"] = { "<ESC>_", "󰜲 Move to beginning of line" },
    ["<C-Right>"] = { "<ESC>$", "󰜵 Move to end of line" },
    ["<C-a>"] = { "gg0vG", " Select all" },
    ["<F3>"] = { "n", " Next" },
    ["<S-F3>"] = { "N", " Previous" },
    -- Operations
    ["<C-x>"] = { "x", "󰆐 Cut" },
    ["<C-v>"] = { "p", "󰆒 Paste" },
    ["<C-c>"] = { "y", " Copy" },
    ["<leader><leader>d"] = { "viw", " Select word" },
    ["<leader>d"] = { 'viw"_di', " Delete word" },
    ["<C-Up>"] = { "<cmd>m .-2<CR>==", "󰜸 Move line up" },
    ["<C-Down>"] = { "<cmd>m .+1<CR>==", "󰜯 Move line down" },
    -- Renamer
    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "󰑕 LSP rename",
    },
    ["<leader>rn"] = {
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      -- ":IncRename "
      "󰑕 Rename",
      opts = { expr = true },
    },
    ["<Esc>"] = {
      function()
        vim.cmd "noh"
        vim.cmd "Noice dismiss"
      end,
      " Clear highlights",
      opts = { silent = true },
    },
  },

  v = {
    ["<C-Up>"] = { ":m'<-2<CR>gv=gv", "󰜸 Move selection up", opts = { silent = true } },
    ["<C-Down>"] = { ":m'>+1<CR>gv=gv", "󰜯 Move selection down", opts = { silent = true } },
    -- Indent backward/forward:
    ["<"] = { "<gv", " Ident backward", opts = { silent = false } },
    [">"] = { ">gv", " Ident forward", opts = { silent = false } },
  },

  c = {
    -- Autocomplete for brackets:
    ["("] = { "()<left>", "Auto complete (", opts = { silent = false } },
    ["<"] = { "<><left>", "Auto complete <", opts = { silent = false } },
    ['"'] = { '""<left>', [[Auto complete "]], opts = { silent = false } },
    ["'"] = { "''<left>", "Auto complete '", opts = { silent = false } },
  },
}

M.window = {
  n = {
    ["<leader><leader>h"] = { "<cmd>vs <CR>", "󰤼 Vertical split", opts = { nowait = true } },
    ["<leader><leader>v"] = { "<cmd>sp <CR>", "󰤻 Horizontal split", opts = { nowait = true } },
  },
}


M.general = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "󰘳 Find files" },

    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", " NvimTree Toggle" },
    -- ["<C-n>"] = {"<cmd> Neotree <CR>", " NeoTree"},

    ["<leader>gl"] = {"<cmd> LazyGit <CR>", " LazyGit"},

    -- Keep cursor in the center line when C-D / C-U
    ["<C-d>"] = { "<C-d>zz", " Scroll down", opts = { silent = true } },
    ["<C-u>"] = { "<C-u>zz", " Scroll up", opts = { silent = true } },

    ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", " Symbols Outline" },
    -- ["<leader>tr"] = {
    --   function()
    --     require("base46").toggle_transparency()
    --   end,
    --   "󰂵 Toggle transparency",
    -- },
 },
}

M.diagnostics = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "󰔫 Toggle warnings" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", " Todo/Fix/Fixme" },
    ["<leader>xxd"] = {"<cmd>TroubleToggle document_diagnostics<cr>", "󰔫 Toggle document diagnostics" },
    ["<leader>xw"] = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "󰔫 Toggle workspace diagnostics" },
    ["<leader>xq"] = {"<cmd>TroubleToggle quickfix<cr>", "󰔫 Toggle quickfix" },
    ["<leader>xl"] = {"<cmd>TroubleToggle loclist<cr>", "󰔫 Toggle loclist" },
    ["<leader>xr"] = {"<cmd>TroubleToggle lsp_references<cr>", "󰔫 Toggle lsp_references" },
    ["<leader>el"] = { "<cmd>ErrorLensToggle<cr>", "󱇭 Toggle error lens" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", " Telescope TODO" },
    -- ["<Leader>ll"] = {
    --   function()
    --     require("lsp_lines").toggle()
    --   end,
    --   " Toggle lsp_lines",
    -- },
  },
}

-- M.node = {
--   n = {
--     ["<leader>ns"] = {
--       function()
--         require("package-info").show()
--       end,
--       "󰎙 Show package info",
--     },
--     ["<leader>up"] = {
--       function()
--         require("package-info").update()
--       end,
--       "󰎙 Update package",
--     },
--     ["<leader>nd"] = {
--       function()
--         require("package-info").delete()
--       end,
--       "󰎙 Delete package",
--     },
--     ["<leader>np"] = {
--       function()
--         require("package-info").change_version()
--       end,
--       "󰎙 Install package",
--     },
--  },
-- }

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd>TSCaptureUnderCursor <CR>", " Find highlight" },
 },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>tt"] = {"<cmd> DapToggleBreakpoint <CR>"},
    ["<F5>"] = { "<cmd>DapContinue <CR>", " Continue" },
    ["<F10>"] = { "<cmd>DapStepOver <CR>", " Step over" },
    ["<F11>"] = { "<cmd>DapStepInto <CR>", " Step into" },
    ["<F9>"] = { "<cmd>DapStepOut <CR>", " Step out" },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

-- M.debug = {
--   n = {
--     ["<leader>tt"] = { "<cmd>GoBreakToggle<CR>", " Toggle breakpoint" },
--     ["<F5>"] = { "<cmd>DapContinue <CR>", " Continue" },
--     ["<F10>"] = { "<cmd>DapStepOver <CR>", " Step over" },
--     ["<F11>"] = { "<cmd>DapStepInto <CR>", " Step into" },
--     ["<F9>"] = { "<cmd>DapStepOut <CR>", " Step out" },
--     -- ["<leader><leader>p"] = {
--     --   function()
--     --     require("debugprint").debugprint()
--     --   end,
--     --   " Step out",
--     -- },
--   },
-- }

M.telescope = {
  n = {
    ["<leader>li"] = { "<cmd>Telescope highlights<CR>", "Highlights" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", " Find keymaps" },
    ["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<CR>", " Find document symbols" },
    ["<leader>fr"] = { "<cmd>Telescope frecency<CR>", " Recent files" },
    -- ["<leader>fu"] = { "<cmd>Telescope undo<CR>", " Undo tree" },
    ["<leader>fz"] = {
      "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>",
      " Find current file",
    },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<tab>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      " Goto next buffer",
    },

    ["<S-tab>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      " Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<C-x>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      " Close buffer",
    },
  },
}

-- M.test = {
--   n = {
--     ["<leader>nt"] = {
--       function()
--         require("neotest").run.run(vim.fn.expand "%")
--       end,
--       "󰤑 Run neotest",
--     },
--   },
-- }


M.bookmark = {
  n = {
    ["<leader>ba"] = { "<cmd> BookmarkToggle<CR>", "󰃅 Add bookmark" },
    ["<leader>bn"] = { "<cmd> BookmarkNext<CR>", "󰮰 Next bookmark" },
    ["<leader>bp"] = { "<cmd> BookmarkPrev<CR>", "󰮲 Prev bookmark" },
    ["<leader>bc"] = { "<cmd> BookmarkClear<CR>", "󰃢 Clear bookmark" },
  },
}

M.lspsaga = {
  n = {
    -- ["<leader>."] = { "<cmd>CodeActionMenu<CR>", "󰅱 Code Action" },
    ["gf"] = {
      function()
        vim.cmd "Lspsaga lsp_finder"
      end,
      " Go to definition",
    },
    ["gt"] = {
      "<cmd>Lspsaga goto_definition<cr>",
      " Go to definition",
    },
    ["<leader>lp"] = {
      "<cmd>Lspsaga peek_definition<cr>",
      " Peek definition",
    },
    ["<leader>k"] = {
      -- "<Cmd>Lspsaga hover_doc<cr>",
      function()
        require("pretty_hover").hover()
      end,
      "󱙼 Hover lsp",
    },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", " Show Outline" },
    --  LSP
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", " Lsp references" },
    ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", " Prev Diagnostic" },
    ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", " Next Diagnostic" },
    ["<leader>qf"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "󰁨 Lsp Quickfix",
    },
  },
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      " Toggle horizontal term",
    },
    ["C-c"] = { [[<C-\><C-c>]], "󰜺 Send SigInt" },
  },

  n = {
    -- toggle in normal mode
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      " Toggle horizontal term",
    },
  },
}


M.lspconfig = {
  n = {
    ["<F12>"] = { "<cmd>Glance references<CR>", "󰘐 References" },
  },
}

return M
