(module dotfiles.util
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn noremap [mode from to opts]
  "Sets a mapping with {:noremap true}."
  (let [map-opts (or opts {})]
    (set map-opts.noremap true)
    (nvim.set_keymap mode from to map-opts)))

(defn map-group [opts mappings]
  (let [(loaded? which-key) (pcall #(require :which-key))]
    (when loaded?
      (which-key.register mappings opts))))

(defn cmd-fmt [cmd]
  (string.format "<cmd>%s<cr>" cmd))

;; Make mixed tables
(defn tassign [table data]
  (accumulate [xs table
               k v (pairs data)]
              (do (tset xs k v)
                xs)))
