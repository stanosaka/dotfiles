(module dotfiles.plugins.lspconfig
  {autoload {nvim aniseed.nvim
             util dotfiles.util
             cmp-nvim-lsp cmp_nvim_lsp
             lsputil-ca lsputil.codeAction}})



(let [lsp (require :lspconfig)
      capabilities (cmp-nvim-lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
      attach-handler (fn [client]
                       (util.noremap :n :K "<cmd>lua vim.lsp.buf.hover()<cr>")
                       (util.noremap :n :<c-s> "<cmd>lua vim.lsp.buf.formatting()<cr>")
                       (util.noremap :n :<localleader>a "<cmd>lua vim.lsp.buf.code_action()<cr>"))]
                       ;; Use "CursorHold,CursorHoldI" for input mode
                       ; (nvim.ex.autocmd "CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })"))]
                       ; (util.noremap :n :<localleader>r "<cmd>lua vim.lsp.buf.rename()<cr>"))]
  (when lsp
    (lsp.clojure_lsp.setup {:capabilities capabilities
                            :on_attach attach-handler})
    (lsp.tsserver.setup {:capabilities capabilities
                         :on_attach (fn [client]
                                      (attach-handler client)
                                      (set client.resolved_capabilities.document_formatting false))})
    (lsp.denols.setup {:capabilities capabilities
                       :init_options {:enable false}}) ; only for formatting

    (set vim.lsp.handlers.textDocument/publishDiagnostics
         (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
                       {:underline true
                        :update_in_insert false
                        :virtual_text {:spacing 2
                                       :prefix "●"}
                        ; :virtual_text false
                        :severity_sort true
                        :signs true}))

    (set vim.lsp.handlers.textDocument/codeAction lsputil-ca.code_action_handler)

    (let [signs {:Error " "
                 :Warn " "
                 :Hint " "
                 :Info " "}]
      (each [diag-type icon (pairs signs)]
        (let [hl (.. "DiagnosticSign" diag-type)]
          (nvim.fn.sign_define hl
                               {:text icon
                                :texthl hl
                                :numhl ""}))))))


; (util.with-which-key
;   (fn [wk]
;     (wk.register {:c {:name "Code"
;                       :r ["<cmd>lua require('lspsaga.rename').rename()<cr>" "Rename"]
;                       :f ["<cmd>lua vim.lsp.buf.formatting()<cr>" "Format"]}}
;                  {:prefix "<leader>"})
;     (wk.register {:a ["<cmd>lua require('lspsaga.codeaction').code_action()<cr>" "Code Action"]}
;                  {:prefix "<leader>"})
;     (wk.register {:g {:d ["<cmd>lua vim.lsp.buf.definition()<cr>" "Go to Definition"]
;                       :D ["<cmd>lua vim.lsp.buf.declaration()<cr>" "Go to Declaration"]}}
;                  {:mode "n"})))

(util.map-group {:prefix :<leader>}
                {:c {:name "Code"
                     :f ["<cmd>lua vim.lsp.buf.formatting()<cr>" "Format"]
                     :r ["<cmd>lua vim.lsp.buf.rename()<cr>" "Rename"]}
                 :l {:name "+LSP"
                     :e ["<cmd> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })<cr>" "Line Errors"]}})

(util.map-group {:mode :n}
                {:g {:d ["<cmd>lua vim.lsp.buf.definition()<cr>" "Go to Definition"]}})


; (util.map-prefix :<localleader> :r ["<cmd>lua vim.lsp.buf.rename()<cr>" "Rename"])

; (util.map-prefix :<leader> :c {:name "Code"}
;                           :r ["<cmd>lua vim.lsp.buf.rename()<cr>" "Rename"]
;                           :f ["<cmd>lua vim.lsp.buf.formatting()<cr>" "Format"])


    ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
    ; (map :gd "lua vim.lsp.buf.definition()")
    ; (map :gD "lua vim.lsp.buf.declaration()")
    ; (map :gr "lua vim.lsp.buf.references()")
    ; (map :gi "lua vim.lsp.buf.implementation()")
    ; (map :<c-k> "lua vim.lsp.buf.signature_help()")
    ; (map :<c-n> "lua vim.lsp.diagnostic.goto_prev()")
    ; (map :<c-p> "lua vim.lsp.diagnostic.goto_next()")

    ; (map :<leader>lr "lua vim.lsp.buf.rename()")
