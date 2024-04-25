> @2-/doc/HTM.js

HOOK = new Set

< (l)=>
  localStorage.LANG = HTM.lang = l
  [...HOOK].map (f)=>
    f l
    return

< onSet = (f)=>
  HOOK.add f
  {lang} = HTM
  if lang
    f lang
  =>
    HOOK.delete f
    return
