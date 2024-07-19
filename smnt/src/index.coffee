< (svelte, target, props)=>
  opt = {
    target
  }
  if props
    opt.props = props
  new svelte opt
