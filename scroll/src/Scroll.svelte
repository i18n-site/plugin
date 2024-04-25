<template lang="pug">
b.scroll(@&b)
  div
    .m(@&m)
      slot
  aside(@&aside @pointerdown=click class:s=turn)
    i(@&si @pointerdown=down)
</template>


<script lang="coffee">
> lodash-es/debounce
  @3-/on:On
  svelte > tick

+ b, aside, m, si, turn, pointerunbind, timer

SCROLL_CLS = "scroll"

click = ({clientY})=>
  {
    top
    height
  } = aside.getBoundingClientRect()
  {clientHeight} = si
  b.scrollTop = Math.round(
    b.scrollHeight *
    Math.max(
      Math.min(
        (clientY - top - clientHeight/2) / (height - clientHeight)
        1
      )
      0
    )
  ) - height
  return

down = (e)=>
  if pointerunbind
    return
  {body} = document
  body.setPointerCapture(e.pointerId)
  for i from [body, aside]
    i.classList.add(SCROLL_CLS)

  + unbind
  pointerunbind = =>
    for i from [body, aside]
      i.classList.remove(SCROLL_CLS)
    unbind()
    pointerunbind = undefined
    return

  pre = e.clientY

  unbind = On body, {
    lostpointercapture: pointerunbind
    pointerup: pointerunbind
    pointermove: ({clientY})=>
      b.scrollTop += Math.round(
        b.scrollHeight * (
          clientY - pre
        ) / aside.clientHeight
      )
      pre = clientY
      return
  }
  return
#       mv = b.value
#       sv = si.value
#       _diff = 0
#       Y = e.screenY
#       _pointerunbind = _on HTML,{
#         lostpointercapture:pointerunbind
#         pointerup:pointerunbind
#         pointermove:({screenY})=>
#           {clientHeight,scrollHeight} = mv
#           diff = screenY - Y
#
#           mv.scrollTop += diff/clientHeight*scrollHeight
#           Y = screenY
#
#           return
#       }
  return

retop = (height)=>
  if not turn
    return
  aside.style.opacity = 1
  ch = b.clientHeight
  si.style.top = (3 + Math.round( (ch - (height or si.offsetHeight) - 6) * b.scrollTop  / (m.scrollHeight - ch) )) + 'px'
  clearTimeout timer
  timer = setTimeout(
    =>
      aside.style.opacity = 0
    1000
  )
  return

onMount =>
  ob = new ResizeObserver(
    debounce(
      (entry)=>
        {clientHeight:ch} = b
        {scrollHeight:sh} = m
        turn = ch < sh
        if turn
          await tick()
          height = Math.max(16,Math.round(ch*ch/sh))
          si.style.height = height + 'px'
          retop(height) # 因为有 transition 的延时，高度不会立刻改变，所以这里传入
        return
      100
    )
  )
  [
    b
    m
    aside # 顶部条下滑的时候，只有这个会改变尺寸
  ].forEach (i)=>ob.observe i

  unbind = On(
    b
    scroll:=>
      retop()
      return
  )

  =>
    unbind()
    pointerunbind?()
    ob.disconnect()
    return

`export { b as root , m as main}`

</script>

<style lang="stylus">
b
  display flex
  overflow auto
  scrollbar-width none
  -ms-overflow-style none

b::-webkit-scrollbar
  width 0

b>div
  height 100%
  margin auto
  position absolute

b>div>div
  align-items center
  display flex
  flex-direction column
  min-height 100%
  width 100%

b>aside
  bottom 0
  display none
  height 100%
  left 100%
  position sticky
  top 0
  user-select none
  width 13px
  z-index 999

  &.s
    display block

  &, &>i
    transition all 0.2s, opacity 1s, box-shadow 1s

  &>i
    background rgba(125, 125, 125, 0.6)
    border-radius 3px
    display block
    position absolute
    right 3px
    width 7px

b
  &>div
    width 100%

  &>aside:hover, &>:global(.scroll)
    background rgba(0, 0, 0, 0.05)
    box-shadow inset 3px 0 3px -3px rgba(0, 0, 0, 0.3), inset -3px 0 3px -3px rgba(0, 0, 0, 0.05)
    opacity 1 !important

  &>aside:hover
    width 21px

    &>i
      background rgba(125, 125, 125, 0.8)
      right 6px
      width 9px

:global(body.scroll)
  cursor url('./grab.svg') 8 7, pointer
</style>
