> @3-/fall
  x/On.js
  @2-/doc/Id.js
  @3-/bsearch

A = 'A'

< (main, ali, toc, main_scroll)=>
  if not main
    # 移动端点击之后侧栏会隐藏, 不需要同步滚动
    return

  + topli, apos, pre

  now = (t)=>
    if pre
      pre.remove A
    t.classList.add A
    pre = t.classList
    return

  toc_scroll = main.parentNode.parentNode.parentNode

  retop = =>
    topli = []
    inittop = main_scroll.getBoundingClientRect().top + 24

    _top = (li)=>
      for i from li
        hash = i[1]
        if Array.isArray hash
          _top hash
          hash = i[0][1]
        elem = Id(hash)
        if elem
          topli.push Math.round elem.getBoundingClientRect().top-inittop
      return

    _top toc

    topli.sort((a,b)=>a-b)
    return

  retop()
  resize = new ResizeObserver(retop)

  fall(
    =>
      resize.disconnect()
      return
    On(
      main_scroll
      scroll:=>
        p = bsearch topli, main_scroll.scrollTop + 20
        if p != apos
          apos = p
          e = ali[p]
          now e
          {top, height} = e.getBoundingClientRect()
          {top:btop, height:bheight} = toc_scroll.getBoundingClientRect()
          diff = top - btop
          if diff < 0
            diff -= 6
          else
            diff +=  (height - bheight)
            if diff > 0
              diff += 6
            else
              return
          toc_scroll.scrollTop += diff
        return
    )
    On(
      main
      click:(e)=>
        {target:t} = e
        if t.tagName == A
          now t
        return
    )
  )
