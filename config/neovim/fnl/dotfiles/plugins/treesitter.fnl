(module dotfiles.plugins.treesitter
  {autoload {treesitter nvim-treesitter.configs
             parsers nvim-treesitter.parsers}})

(set parsers.list.norg
     {:install_info {:url "https://github.com/nvim-neorg/tree-sitter-norg"
                     :files [ "src/parser.c" "src/scanner.cc"]
                     :branch "main"}})

(set parsers.list.markdown
     {:install_info {:url "https://github.com/ikatyang/tree-sitter-markdown"
                     :files [ "src/parser.c" "src/scanner.cc"]}
      :filetype "markdown"})

(set parsers.list.janet
     {:install_info {:url "https://github.com/GrayJack/tree-sitter-janet"
                     :files [ "src/parser.c" "src/scanner.c"]}
      :filetype "janet"})

(treesitter.setup
  {:ensure_installed :all
   :highlight {:enable true
               :additional_vim_regex_highlighting false}
   :indent {:enable true}
   :textobjects {:select {:enable true
                          ;; Automatically jump forward to textobj, similar to targets.vim
                          :lookahead true
                          :keymaps {:af "@function.outer"
                                    :if "@function.inner"}}
                 :move {:enable true
                        ;; Whether to set jumps in the jumplist
                        :set_jumps true
                        :keymaps {:goto_next_start     {"]f" "@function.outer"}
                                  :goto_next_end       {"]F" "@function.outer"}
                                  :goto_previous_start {"[f" "@function.outer"}
                                  :goto_previous_end   {"[F" "@function.outer"}}}}})
