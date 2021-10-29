(module dotfiles.plugins.which-key)

(let [(loaded? which-key) (pcall #(require :which-key))]
  (when loaded?
    (which-key.setup
      {:hidden {"<silent>" "<cmd>" "<Cmd>" "<CR>" "call" "lua" "^:" "^ " "<plug>" "<Plug>"}})))
