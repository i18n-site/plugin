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
      c.remove R
    else
      c.add R
  return

onMount =>
  for i in BODY.children
    if i.tagName == 'NAV'
      B = New['m-c']
      Object.assign(
        B
        {
          className:'toc'
          onclick: =>
            S = !B.classList.toggle R
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

@media (max-width 990px)
  b + :global(b)
    padding 0

@media (max-width 440px)
  b
    width 100%

    &>i
      display none

:global(body>nav>b>m-c.toc)
  background-image var(--svgToc)
  border 2px solid #000
  box-shadow #999 0 0 3px inset
  margin-left 0
  margin-right 24px

:global(body>nav>b>m-c.toc.R)
  box-shadow none
  transform rotate(180deg)

:global(body>nav.H + b>div>div>b), :global(body>nav.N + b>div>div>b)
  top 0 !important
</style>

