(module dotfiles.plugins.lualine
  {autoload {lualine lualine
             codedark lualine.themes.codedark}})

(let [green     :#608B4E
      pink      :#C586C0
      lightred  :#D16969
      blue      :#569CD6
      custom-codedark {:normal codedark.normal
                       :insert codedark.insert
                       :visual codedark.visual
                       :replace codedark.replace
                       :inactive codedark.inactive}]
  (set custom-codedark.normal.c.fg green)
  (set custom-codedark.visual.c {:fg pink})
  (set custom-codedark.replace.c.fg lightred)
  (set custom-codedark.insert.c.fg blue)
  (lualine.setup
    {:options {:theme custom-codedark
               :section_separators ""
               :component_separators ""}}))
