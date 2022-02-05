local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

telescope.load_extension('fzf')
