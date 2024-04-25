> ./index.js:Box
  @2-/focus

< (svelte, props)=>
  r = Box(svelte, props)
  # 不 setTimeout 会导致 chrome 123.0.6312.87 不 focus
  setTimeout =>
    focus r[0]
    return
  r



