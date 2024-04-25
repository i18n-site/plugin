> @~3/svelte_mount:mount
  ./New.js

< (svelte, props)=>
  New(
    (target)->
      mount(
        svelte
        target
        props
      )
    (m)=>
      m.$destroy()
      return
  )
