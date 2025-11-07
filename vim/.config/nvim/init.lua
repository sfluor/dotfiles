if vim.g.vscode then
    -- IMPORTANT: Only change the BROWSER_CMD if you're not on macOS!
  local BROWSER_CMD = "open" -- Use 'xdg-open' (Linux) or 'start' (Windows)

  -- Helper to safely run a Git command and clean its output
  local function git_exec(cmd)
    -- Uses vim.fn.system() to execute the command silently
    return vim.fn.trim(vim.fn.system(cmd .. " 2> /dev/null"))
  end

  -- 1. Get the current branch
  local function get_git_branch()
    local branch = git_exec("git rev-parse --abbrev-ref HEAD")
    return (branch == "HEAD" or branch == "") and "main" or branch -- Fallback to 'main'
  end

  -- 2. Determine the project root (used to calculate the file's relative path)
  local function get_project_root()
    -- Find the closest directory containing a .git folder
    local root = git_exec("git rev-parse --show-toplevel")
    -- Append a trailing slash for use in Lua's gsub
    return root ~= "" and (root .. "/") or nil
  end

  -- 3. Determine the GitHub base URL
  local function get_repo_base()
    local remote_url = git_exec("git config --get remote.origin.url")
    if remote_url == "" then
      return nil
    end

    -- Convert the Git URL (SSH or HTTPS) into a browser URL
    -- Example SSH: git@github.com:user/repo.git
    -- Example HTTPS: https://github.com/user/repo.git

    -- 1. Clean up trailing ".git"
    local base_url = remote_url:gsub("%.git$", "")

    -- 2. Convert SSH format to HTTPS format (user@host:path -> https://host/path)
    base_url = base_url:gsub("^git@github%.com:", "https://github.com/")

    -- The final format should be: https://github.com/user/repo
    return base_url
  end

  vim.api.nvim_create_user_command("Gline", function()
    local file_path = vim.fn.expand("%:p")
    local project_prefix = get_project_root()
    local repo_base = get_repo_base()

    -- --- Validation and Exit Checks ---
    if file_path == "" then
      print("Error: No saved file in buffer.")
      return
    end
    if not project_prefix or not repo_base then
      print("Error: Not in a recognized Git repository.")
      return
    end

    -- --- URL Construction ---
    local current_ref = get_git_branch()
    local current_line = vim.fn.line(".")

    -- Trim the prefix path to get the relative path
    local relative_path = file_path:gsub("^" .. project_prefix, "")

    -- Assemble the final URL: BASE/blob/BRANCH/FILEPATH#LNUMBER
    local final_url = string.format("%s/blob/%s/%s#L%s", repo_base, current_ref, relative_path, current_line)

    -- --- Execution ---
    local shell_command = string.format("%s %s", BROWSER_CMD, final_url)
    vim.fn.system(shell_command)

    print("Opened GitHub: " .. final_url)
  end, {
    desc = "Open current file at current line on GitHub",
    nargs = 0,
  })

  vim.keymap.set("n", "gh", ":Gline<CR>", { desc = "Browse GitHub Line" })

  
  -- VSCode extension
  local vscode = require("vscode")
  vim.keymap.set({ "n" }, "<space>R", function()
    vscode.action("editor.action.refactor")
  end)
  vim.keymap.set({ "n" }, "<space>r", function()
    vscode.action("editor.action.rename")
  end)
  vim.keymap.set({ "n" }, "gd", function()
    vscode.action("editor.action.goToDeclaration")
  end)
  vim.keymap.set({ "n" }, "gr", function()
    vscode.action("editor.action.goToReferences")
  end)
  vim.keymap.set({ "n" }, "gf", function()
    vscode.action("workbench.action.findInFiles")
  end)
  vim.keymap.set({ "n" }, "<space>e", function()
    vscode.action("revealInExplorer")
  end)
  vim.keymap.set({ "n" }, "gs", function()
    vscode.action("workbench.action.showAllSymbols")
  end)
  vim.keymap.set({ "n" }, "gS", function()
    vscode.action("workbench.action.gotoSymbol")
  end)
  vim.keymap.set({ "n" }, "gi", function()
    vscode.action("editor.action.goToImplementation")
  end)
  vim.keymap.set({ "n" }, "ga", function()
    vscode.action("editor.action.quickFix")
  end)
  vim.keymap.set({ "n" }, "ge", function()
    vscode.action("editor.action.marker.next")
  end)
  vim.keymap.set({ "n" }, "gE", function()
    vscode.action("editor.action.marker.nextInFiles")
  end)
  vim.keymap.set({ "n" }, "g<space>", function()
    vscode.action("closeMarkersNavigation")
  end)
  vim.keymap.set({ "n" }, "<CR>", function()
    vscode.action("workbench.action.files.save")
  end)
  vim.keymap.set({ "n" }, "gp", function()
    vscode.action("workbench.action.quickOpen")
  end)
  vim.keymap.set({ "n" }, "gb", function()
    vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
  end)
  vim.keymap.set({ "n" }, "<space><space>", function()
    vscode.action("workbench.action.showCommands")
  end)
  vim.keymap.set({ "n" }, "<space>ft", function()
    vscode.action("terminal.focus")
  end)
  vim.keymap.set({ "n" }, "<space>v", function()
    vscode.action("workbench.action.openView")
  end)
  vim.keymap.set({ "n" }, "<space>tn", function()
    vscode.action("testing.runAtCursor")
  end)
  vim.keymap.set({ "n" }, "<space>tr", function()
    vscode.action("testing.reRunLastRun")
  end)
  vim.keymap.set({ "n" }, "<C-l>", function()
    vscode.action("workbench.action.focusNextGroup")
  end)
  vim.keymap.set({ "n" }, "<C-h>", function()
    vscode.action("workbench.action.focusPreviousGroup")
  end)
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
