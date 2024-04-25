> @3-/on:On
  @2-/new:New

< (create, rm)=>
  + b
  ->
    p = @parentNode
    if not b
      {b} = New
      b.className = 'menu'
      m = create.call @, b
      p.append b
      setTimeout =>
        unbind = On document.body,{
          click:=>
            rm m
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
