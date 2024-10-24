> ./body.styl
  x/On.js

H = 'H'
D = 'D'
N = 'N'

< (head, scrollElem)=>
  {classList} = head
  pre_y = 0
  pre_diff = 0

  min_hide_height = head.offsetHeight + 30 # 避免收起来之后滚动条没有了

  scrolltop = (scrollTop)=>
    if classList.contains H
      pre_y = scrollTop
      return
    if scrollTop != pre_y
      diff = scrollTop - pre_y

      if scrollTop and Math.abs(diff) < 20
        return

      pre_y = scrollTop

      add = remove = undefined

      if diff > 0 and pre_diff <= 0
        if scrollTop < min_hide_height
          return
        add = H
        remove = D
      else if diff < 0 and pre_diff > 0
        add = D
        remove = H
        classList.remove N

      if add
        classList.remove remove
        classList.add add
        setTimeout(
          =>
            if classList.contains H
              classList.remove H
              classList.add N
            return
          300
        )

      pre_diff = diff
    return

  scroll = =>
    scrolltop scrollElem.scrollTop
    return

  resize = new ResizeObserver scroll
  resize.observe(scrollElem)

  unmount = On(
    scrollElem
    {
      scroll
    }
  )
  =>
    scrolltop 0
    resize.disconnect()
    unmount()
    return
