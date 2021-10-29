(module dotfiles.mappings
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             core aniseed.core
             util dotfiles.util}})

;; Generic mapping configuration.
(util.noremap :n :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Delete hidden buffers.
; (util.noremap :n :<leader>bo ":call DeleteHiddenBuffers()<cr>")

;; Correct to first spelling suggestion.
; (util.noremap :n :<leader>zz ":normal! 1z=<cr>")

;; Trim trialing whitespace.
; (util.noremap :n :<leader>bt ":%s/\\s\\+$//e<cr>")

;; Select mode trick
;; NOTE: Normal mapping: enters select mode with the word nearest the cursor selected.
;; NOTE: You can then type your replacement for the selected word and use the:
;; NOTE: Insert mapping: Jumps to the next match and enters selection mode.
;; NOTE: You can then either type a new replacement or press . to use the:
;; NOTE: Select mapping: re-enters the last-inserted text — essentially, repeats the last insertion.
;; NOTE: https://www.reddit.com/r/vim/comments/5u99rh/select_mode/ddshdj4/
; (util.noremap :n :§ "*``gn<c-g>")
; (util.noremap :i :§ "<c-o>gn<c-g>")
; (util.noremap :s :. "@." {:expr true})

(nu.fn-bridge
  :DeleteHiddenBuffers
  :dotfiles.mappings :delete-hidden-buffers)

(defn delete-hidden-buffers []
  (let [visible-bufs (->> (nvim.fn.range 1 (nvim.fn.tabpagenr :$))
                          (core.map nvim.fn.tabpagebuflist)
                          (unpack)
                          (core.concat))]
    (->> (nvim.fn.range 1 (nvim.fn.bufnr :$))
         (core.filter
           (fn [bufnr]
             (and (nvim.fn.bufexists bufnr)
                  (= -1 (nvim.fn.index visible-bufs bufnr)))))
         (core.run!
           (fn [bufnr]
             (nvim.ex.bwipeout bufnr))))))


;; Easy Buffer Navigation and manipulation
(util.noremap :n :<leader>d "<cmd>Bclose<cr>")
(util.noremap :n :<leader>D "<cmd>Bclose!<cr>")
; (util.noremap :n :<leader>o "<cmd>%bd|e#<cr>") ; close all buffers(%), open last for editing(e#) : mnemonic 'o' -> only
(util.noremap :n :<leader>o "<cmd>silent! call :DeleteHiddenBuffers<cr>")

;; Buffer cycling
(util.noremap :n :<c-l> "<cmd>bnext<cr>")
(util.noremap :n :<c-h> "<cmd>bprev<cr>")

;; Line swap
(util.noremap :n :<c-j> "<cmd>m .+1<cr>")
(util.noremap :n :<c-k> "<cmd>m .-2<cr>")
(util.noremap :v :<c-j> "<cmd>m .+1<cr>")
(util.noremap :v :<c-k> "<cmd>m .-2<cr>")

;; Easy clipboard access
(util.noremap :n :+ "\"+")
(util.noremap :i :<c-p> "<c-r>\"")

;; Remove last search highlight
(util.noremap :n :<c-c> "<cmd>let @/ = ''<cr>")

;; CamelCase Motions
(nvim.set_keymap :n :<localleader>w "<Plug>CamelCaseMotion_w" {:silent true})
(nvim.set_keymap :o :<localleader>w "<Plug>CamelCaseMotion_w" {:silent true})
(nvim.set_keymap :x :<localleader>w "<Plug>CamelCaseMotion_w" {:silent true})

(nvim.set_keymap :n :<localleader>b "<Plug>CamelCaseMotion_b" {:silent true})
(nvim.set_keymap :o :<localleader>b "<Plug>CamelCaseMotion_b" {:silent true})
(nvim.set_keymap :x :<localleader>b "<Plug>CamelCaseMotion_b" {:silent true})

;; FZF (NOTE: replaced by Telescope)
; (util.noremap :n :<c-p> ":Files<cr>")

;; Magit
(util.noremap :n :<leader>m ":Magit<cr>")

;; Tabularize
(nvim.set_keymap :n :<leader>t= ":Tabularize /=<cr>" {})
(nvim.set_keymap :v :<leader>t= ":Tabularize /=<cr>" {})
(nvim.set_keymap :n :<leader>t: ":Tabularize /:\\zs<cr>" {})
(nvim.set_keymap :v :<leader>t: ":Tabularize /:\\zs<cr>" {})
(nvim.set_keymap :n :<leader>t<bar> ":Tabularize /<bar><cr>" {})
(nvim.set_keymap :v :<leader>t<bar> ":Tabularize /<bar><cr>" {})

;; Normal mode
; (util.map-group {:mode :n}
;                 {:g {:c ["<cmd>lua vim.lsp.buf.definition()<cr>" "Go to Definition"]}})

;; Visual mode
; (util.map-group {:mode :v}
;                 {:g {:c ["<cmd>lua vim.lsp.buf.definition()<cr>" "Go to Definition"]}})

;; Localleader (Normal)
(util.map-group {:prefix :<localleader>}
                {:s [":%s//g<left><left>" "Replace"]})
                ; {:s (doto [":%s//g<left><left>" "Replace"] (tset :silent false))})

;; Localleader (Visual)
(util.map-group {:prefix :<localleader>
                 :mode :v}
                {:s [":s//g<left><left>" "Replace"]})

;; Code Actions (nvim-code-action-menu)
; (util.noremap :n :<localleader>a ":CodeActionMenu<cr>")

;; NERDTree
; (util.noremap :n :<c-b> ":NERDTreeToggle<cr>")

;; <Tab> & <S-Tab> to navigate the completion menu
; (nvim.set_keymap :i :<tab> "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"" {:noremap true :expr true})
; (nvim.set_keymap :i :<s-tab> "pumvisible() ? \"\\<C-p>\" : \"\\<Tab>\"" {:noremap true :expr true})

;; Find and replace
; map('n', '<Leader>s', ':%s//g<Left><Left>', { noremap = true })
; map('v', '<Leader>s', ':s//g<Left><Left>', { noremap = true })

;; Find and replace all occurences of focused word, in current buffer
; map('n', '<Leader>S', ':%s/\\<<C-r><C-w>\\>/', { noremap = true })

;; Save file as sudo on files that require root permission
; map('c', 'w!!', 'execute \'silent! write !sudo tee % >/dev/null\' <bar> edit!', opts)

;; read escape in terminal .. double tap to go back to insert mode
; (util.noremap :t :<esc><esc> "<c-\\><c-n>")
