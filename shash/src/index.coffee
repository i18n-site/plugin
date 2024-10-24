> @2-/doc/Id.js
  @3-/fall
  svelte > tick
  x/On.js

< (root)=>
  main = root.childNodes[0].childNodes[0]

  scrollTo = (hash)=>
    e = Id hash
    if e
      # 这样可以避免 position: absolute 的影响
      root.scrollTop = e.getBoundingClientRect().y - main.getBoundingClientRect().y - 18
      return 1
    return

  hash = location.hash.slice(1)

  + resize
  if hash
    do =>
      resize = new ResizeObserver(
        =>
          # 等 markdown 动态生成 id , 因为生成要等一次 tick , 所以这里延迟2个
          n = 3
          while --n
            await tick()
          if scrollTo hash
            resize.disconnect()
          return
      )
      resize.observe main
      setTimeout(
        =>
          resize.disconnect()
          return
        5e3
      )
      return

  event = {
    hashchange: () =>
      hash = location.hash.slice(1)
      if hash
        scrollTo hash
      return
  }

  fall(
    On(
      window
      event
    )
    =>
      resize?.disconnect()
      return
  )
