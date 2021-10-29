(module dotfiles.plugins.conjure
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(set nvim.g.conjure#eval#result_register "*")
(set nvim.g.conjure#log#botright true)
(set nvim.g.conjure#mapping#doc_word "gk")
(set nvim.g.conjure#extract#tree_sitter#enabled true)

; (util.map-prefix :<localleader>
;                  {:e {:name "+eval (Conjure)"
;                       :! ["<cmd>ConjureEvalReplaceForm<cr>" "Eval & Replace form"]
;                       :e ["<cmd>ConjureEvalCurrentForm<cr>" "Eval current form"]
;                       :r ["<cmd>ConjureEvalRootForm<cr>" "Eval root form"]
;                       :b ["<cmd>ConjureEvalBuf<cr>" "Eval buffer"]
;                       :f ["<cmd>ConjureEvalFile<cr>" "Eval file"]
;                       :m ["<cmd>ConjureEvalMarkedForm<cr>" "Eval marked form"]
;                       :w ["<cmd>ConjureEvalWord<cr>" "Eval word"]}})
