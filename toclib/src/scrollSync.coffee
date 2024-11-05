> x/On.js
  @2-/doc/Id.js

A = 'A'

_elemLi = (toc, li)=>
  for i from toc
    hash = i[1]
    if Array.isArray hash
      _elemLi hash, li
      hash = i[0][1]
    elem = Id(hash)
    li.push elem
  return

elemLi = (toc)=>
  li = []
  _elemLi(toc, li)
  return li
  #   topli = []
  #   inittop = main_scroll.getBoundingClientRect().top + 24
  #
  #   _top = (li)=>
  #     for i from li
  #       hash = i[1]
  #       if Array.isArray hash
  #         _top hash
  #         hash = i[0][1]
  #       elem = Id(hash)
  #       if elem
  #         topli.push Math.round elem.getBoundingClientRect().top-inittop
  #     return
  #
  #   _top toc
  #
  #   topli.sort((a,b)=>a-b)
  #   return

HASH = location.hash.slice(1)

< (main, ali, toc, main_scroll)=>
  if not main
    # 移动端点击之后侧栏会隐藏, 不需要同步滚动
    return

  + pre, top

  toc_scroll = main.parentNode.parentNode.parentNode
  now = (e)=>
    if pre
      pre.classList.remove A
    e.classList.add A
    pre = e
    {top, height} = e.getBoundingClientRect()
    {top:btop, height:bheight} = toc_scroll.getBoundingClientRect()
    diff = top - btop
    if diff < 0
      diff -= 6
    else
      diff += (height - bheight)
      if diff > 0
        diff += 6
      else
        return
    toc_scroll.scrollTop += diff
    return

  elem_li = elemLi toc

  id_a = new Map

  for i,pos in ali
    id_a.set i.hash.slice(1), [i,pos]

  srv = new IntersectionObserver(
    (li)=>
      + a
      {scrollTop} = main_scroll

      now_hash = location.hash.slice(1)
      # 点击章节的导致滚动
      if HASH != now_hash
        # 这里 a 也有可能不存在, 比如 now_hash 的乱写的
        a = id_a.get(now_hash)

      if a
        HASH = now_hash
        now a[0]
      else
        for i in li
          # 获取正文标题对应侧栏链接
          a = id_a.get(i.target.id)
          if a
            [a, pos] = a
            if i.isIntersecting
              now a
              break
            else if a == pre and scrollTop < top and pos
              # 避免一个很长的章节往上滚动不显示
              now ali[pos-1]

      top = scrollTop
      return
    threshold: 1
  )
  for i from elem_li
    srv.observe i

  =>
    srv.disconnect()
    return
