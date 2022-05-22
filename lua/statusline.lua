local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
  return
end

local gps_ok, gps = pcall(require, "nvim-gps")
if not gps_ok then
  return
end

local colors = {
  bg = "#eaffff",
  black = "#000000"
}

local acme = {
  normal = {
    a = { fg = colors.black, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.black, bg = colors.bg },
    c = { fg = colors.black, bg = colors.bg },
  },
  insert = { a = { fg = colors.black, bg = colors.bg, gui = 'bold' } },
  visual = { a = { fg = colors.black, bg = colors.bg, gui = 'bold' } },
  replace = { a = { fg = colors.black, bg = colors.bg, gui = 'bold' } },
  inactive = {
    a = { fg = colors.black, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.black, bg = colors.bg },
    c = { fg = colors.black, bg = colors.bg },
  },
}

lualine.setup({
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available }
    }
  },
  extensions = {"fugitive", "nvim-tree", "quickfix"},
  options = { theme = acme }
})
