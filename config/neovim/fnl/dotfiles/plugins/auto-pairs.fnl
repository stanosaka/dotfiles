(module dotfiles.plugins.auto-pairs)

(let [nvim-autopairs (require :nvim-autopairs)]
  (when nvim-autopairs
    (nvim-autopairs.setup
      {:disable_in_macro true})))

;; AutoPairs LISP config

; (defn init []
;   (let [auto-pairs nvim.g.AutoPairs]
;     ;; For lisp
;     ; (tset auto-pairs "'" nil)
;     ; (tset auto-pairs "`" nil)
;     (set nvim.b.AutoPairs auto-pairs)))

; (vim.schedule
;   (fn []
;     (nvim.ex.autocmd
;       :FileType
;       "clojure,fennel,scheme"
;       "lua require('dotfiles.plugin.auto-pairs').init()")))
