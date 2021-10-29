(module dotfiles.plugins.trouble
  {autoload {util dotfiles.util
             trouble trouble}})

(trouble.setup {})

(util.map-group {:prefix :<leader>}
                {:l {:name "+LSP"
                     :l ["<cmd>TroubleToggle<cr>" "List Toggle [Trouble]"]}})
