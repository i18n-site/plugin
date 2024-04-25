# 寻找 box 上级的 dialog

< (e)=>
  while e
    if e.tagName == 'DIALOG'
      return e
    e = e.parentNode
  return
