set commentstring=//\ %s

highlight ExtraWhitespace ctermbg=red guibg=red
2match ExtraWhitespace /^\t*\zs \+/
