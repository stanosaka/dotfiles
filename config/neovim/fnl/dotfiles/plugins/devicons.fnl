(module dotfiles.plugins.nvim-web-devicons)

(let [nvim-web-devicons (require :nvim-web-devicons)]
  (when nvim-web-devicons
    (nvim-web-devicons.setup)))
