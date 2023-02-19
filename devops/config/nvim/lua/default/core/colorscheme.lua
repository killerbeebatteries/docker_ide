local status, _ = pcall(vim.cmd, "colorscheme atom")
if not status then
  print("Colorscheme not found!")
  return
end
