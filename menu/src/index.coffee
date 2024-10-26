> @8p/smnt:mount
  svelte > unmount
  x/On.js
  @2-/new:New

< (svelte, props)=>
  + b
  ->
    p = @parentNode
    if not b
      {b} = New
      b.className = 'menu'
      m = mount svelte, b, props
      p.append b
      setTimeout =>
        unbind = On document.body,{
          click:=>
            unmount m
            setTimeout(
              =>
                p.removeChild b
                b = undefined
                return
            )
            unbind()
            return
        }
        return
    b
