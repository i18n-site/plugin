> x/xBox.js
  @8p/smnt:Mount
  x/On.js

< (svelte, props)=>
  box = xBox()
  m = Mount svelte,box,props
  unbind = On(
    box
    close: =>
      unbind()
      m.$destroy()
      return
  )
  [
    box
    m
  ]
