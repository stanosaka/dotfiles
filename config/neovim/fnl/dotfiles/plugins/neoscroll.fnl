(module dotfiles.plugins.neoscroll
  {autoload {neoscroll neoscroll
             config neoscroll.config}})

;; Disable default mappings
(neoscroll.setup {:mappings []})

    ; -- All these keys will be mapped to their corresponding default scrolling animation
    ; mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    ;             '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    ; hide_cursor = true,          -- Hide cursor while scrolling
    ; stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    ; use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    ; respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    ; cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    ; easing_function = nil,       -- Default easing function
    ; pre_hook = nil,              -- Function to run before the scrolling animation starts
    ; post_hook = nil,             -- Function to run after the scrolling animation ends)
; }))

(config.set_mappings {:<c-u> [:scroll ["-vim.wo.scroll" :true :200]]
                      :<c-d> [:scroll ["vim.wo.scroll" :true :200]]
                      :<c-y> [:scroll [:-0.10 :false :70]]
                      :<c-e> [:scroll [:0.10 :false :70]]
                      :zt [:zt [:200]]
                      :zz [:zz [:200]]
                      :zb [:zb [:200]]})
