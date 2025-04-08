return {
  {
    "folke/snacks.nvim",
    keys = {
      -- Top Pickers & Explorer
      --
      {
        "gF",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Grep on word",
      },
      {
        "gh",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "gp",
        function()
          Snacks.picker.git_files()
        end,
        desc = "Find git files",
      },
      {
        "gf",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "gb",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent",
      },
      {
        "gu",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "go",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      -- LSP
      {
        "gs",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "gi",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },
      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      -- Other
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>Z",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
    },
  },
}
