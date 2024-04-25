> ./set.js > onSet
  @3-/utf8/utf8d.js

< (req)=>
  + i18n

  HOOK = new Set

  onSet (lang)=>
    i18n = await req(lang)
    for f from HOOK
      f.call i18n
    return

  (f)=>
    HOOK.add f
    if i18n
      f.call i18n
    =>
      HOOK.delete f
      return

