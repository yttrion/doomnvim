-- docker/build.lua
-- Headless build-time script. Blocks until Lazy and Mason have actually
-- finished, and prints clear markers to stderr (visible in
-- `docker build --progress=plain` output) instead of failing silently.
--
-- Treesitter is intentionally NOT installed/compiled here - syntax
-- highlighting relies on Neovim's built-in legacy syntax files
-- (syntax/*.vim), which ship in the runtime with zero extra dependencies.

local function log(msg)
  io.stderr:write("[build.lua] " .. msg .. "\n")
end

-- 1) Plugins -------------------------------------------------------------
local lazy_ok, lazy_err = pcall(function()
  require("lazy").sync({ wait = true, show = false })
end)
log(lazy_ok and "Lazy sync: OK" or ("Lazy sync FAILED: " .. tostring(lazy_err)))

-- 2) Force-load every plugin ------------------------------------------------
-- Lazy.sync() only installs plugin FILES. Plugins that lazy-load on an event
-- (BufReadPre, FileType, VeryLazy...) never get their config()/opts() run in
-- a headless session with no buffer opened - which means mason-lspconfig's
-- own `ensure_installed` (wherever it's declared in doomnvim's actual config)
-- never fires either. Force-loading everything makes headless behave like a
-- real session that eventually triggered every lazy-load condition.
local all_plugins = {}
pcall(function()
  all_plugins = vim.tbl_keys(require("lazy.core.config").plugins)
end)
local load_ok, load_err = pcall(function()
  require("lazy").load({ plugins = all_plugins })
end)
log(load_ok and ("force-loaded " .. #all_plugins .. " plugins: OK")
  or ("force-load FAILED: " .. tostring(load_err)))

vim.cmd("qa")

