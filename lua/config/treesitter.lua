local M = {}

function M.setup()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  configs.setup {
    ensure_installed = 'all',
    ignore_install = { 'norg', 'phpdoc' }
  }
end

return M
