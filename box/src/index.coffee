> x/xBox.js
  @8p/smnt:Mount
  x/On.js
  svelte > unmount

< (svelte, props)=>
  box = xBox()
  m = Mount svelte,box,props
  unbind = On(
    box
    close: =>
      unbind()
      unmount m
      return
  )
  [
    box
    m
  ]
