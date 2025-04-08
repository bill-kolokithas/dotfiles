vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 100
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = 'a'
vim.opt.mousemodel = 'popup'
vim.opt.shortmess:append("c")
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.sessionoptions:append({ "winpos" })
vim.opt.diffopt = "filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"
vim.opt.fillchars:append({ diff = "╱" })
vim.opt.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

vim.diagnostic.config({
  virtual_text = {
    current_line = true
  }
})
