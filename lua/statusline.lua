local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
  return
end

local gps_ok, gps = pcall(require, "nvim-gps")
if not gps_ok then
  return
end

lualine.setup({
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available }
    }
  },
  extensions = {"fugitive", "nvim-tree", "quickfix"}
})
