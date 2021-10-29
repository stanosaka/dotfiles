(module dotfiles.plugins.colorizer)

(let [colorizer (require :colorizer)]
  (when colorizer
    (colorizer.setup)))
