<script lang="coffee">
> @2-/doc/BODY.js
  @2-/new:New
  x/On.js
  @3-/fall
  @2-/pa/epa.js

S = 1 # 必须先加载一次 , 因为目录 Toc 会给 HTML 加锚点

+ B

R = 'R'

resize = =>
  S = window.innerWidth > 990
  if B
    {classList:c} = B
    if S
      c.add R
    else
      c.remove R
  return

onMount =>
  for i in BODY.children
    if i.tagName == 'NAV'
      B = New.i
      Object.assign(
        B
        {
          className:'toc R'
          onclick: =>
            S = B.classList.toggle R
            return
        }
      )
      i.firstChild.prepend B
      break

  setTimeout =>
    resize()
    return

  fall(
    =>
      B?.remove()
      return
    On(
      window
      {
        resize
      }
    )
  )

{pathname} = location
click = (e)=>
  p = epa e
  if p
    if window.innerWidth <= 990
      pp = p.pathname
      if pp and (pp != pathname or not p.nextSibling?.children.length)
        S = 0
        B.classList.remove R
    pathname = p.pathname
    return
  return
</script>

<template lang="pug">
+if S
  b(@click)
    //- i 可以用来做拖拽调整大小
    i
    slot
</template>

<style lang="stylus">
@import '~/styl/var.styl'

b
  background linear-gradient(90deg, #fff, #fcfcfc)
  bottom 0
  left 0
  overflow hidden
  position fixed
  top 65px
  transition all 0.3s
  width 400px
  z-index 9

  &>:global(b)
    bottom 0
    left 0
    position absolute
    right 0
    top 0

  &>:global(b>div>div>b)
    width 100%

  &>i
    background #eee
    height 100%
    position absolute
    right 0
    width 1px
    z-index 9

b + :global(b)
  box-sizing border-box
  padding-left 400px

:global(body>nav>b>i.toc)
  background var(--svgToc) 50% 50% / 18px no-repeat
  border 1px solid #000
  border-radius 16px
  box-shadow none
  cursor e-resize
  height 29px
  margin-left 0
  margin-right 18px
  opacity 0.4
  transform rotate(180deg)
  transition transform 0.5s
  width 36px

  &:hover
    filter btn-hover-filter
    opacity 1

:global(body>nav>b>i.toc.R)
  box-shadow #999 0 0 3px inset
  cursor w-resize
  transform none

:global(body>nav.H + b>div>div>b), :global(body>nav.N + b>div>div>b)
  top 0 !important

@media (max-width 990px)
  b
    position fixed
    top 0
    z-index 1100

    & + :global(b)
      padding 0

  :global(body>nav:has(b>i.toc.R))
    display flex

  :global(body>nav>b>i.toc.R)
    background #000
    border 0
    border-radius 0
    filter none
    height 200dvh
    margin 0
    opacity 0.4
    position fixed
    top 0
    transform rotate(180deg)
    width 100%
    z-index 2

@media (max-width 440px)
  b
    right 60px
    width auto

    &>i
      display none
</style>

