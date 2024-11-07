<template lang="pug">
nav(@&nav)
  b
    //- 目录按钮的容器
    i-h(data-h="t1")
  b.T(@&T)
    b
      +if L
        +each L as i
          +if Array.isArray(i[1])
            <svelte:component this="{i[0]}" A={i[1]}/>
            +else
              a(href:i[1]) { i[0] }
        +else
          i.w
      i-h(data-h="t2")
    b
      slot
  i(@click=bS)
    //- 手机视图下切换显示侧栏的按钮
</template>


<script lang="coffee">
> ./topfix.js > set
  @2-/pa/epa.js
  @3-/fall
  x/isPrefix.js
  x/On.js
  x/route.js
  x/langSite.js
  x/_.js > NAV

+ L, nav, U, T

bS = ->
  S = 'S'
  classList = @parentNode.classList
  if classList.toggle S
    p = location.pathname
    U = On(
      T
      click: (e)=>
        e = epa e
        if e
          ep = e.pathname
          if ep and ep != p
            U()
            classList.remove S
        return
    )
  else
    U()
  return

classNow = =>
  now = 'n'
  li = [...T.firstChild.getElementsByTagName('a')]

  {pathname} = location
  for i, p in li
    if i.pathname == pathname
      i.classList.add now
      li.splice(p,1)
      for i from li
        i.classList.remove now
      return

  loop
    i = li.pop()
    if not i
      break
    {pathname:p, rev, classList} = i
    p = p or ('/'+rev)
    if p and isPrefix p, pathname
      classList.add now
      break
    classList.remove now

  for i from li
    i.classList.remove now
  return

onMount =>
  set nav
  fall(
    langSite =>
      L = _NAV.map(
        (
          [
            url
            _ # use
            menu
          ],
          pos
        ) =>
          i18n = _L[pos]
          if menu
            args =  [
              i18n
              url
            ]
            p = menu.indexOf(' ')
            if ~p
              args.push menu.slice(p + 1)
              menu = menu.slice(0, p)
            return [
              NAV[menu]
              args
            ]
          if url[0] != "/"
            url = "/" + url
          return [
            i18n
            url
          ]
      )
      setTimeout(
        classNow
      )
      return
    route classNow
  )
</script>

<style lang="stylus">
@import '~/styl/var.styl'

nav
  align-items center
  background linear-gradient(0, #fcfcfc, #fff 50%, #fcfcfc)
  font-family 'h'
  font-variation-settings 'wght' 400, 'BEVL' 1
  justify-content space-between
  padding 0 24px
  user-select none

  :global(input)
    line-height 1.625

  &>b.T
    &>b:first-child
      &>a, &>:global(b)
        margin-right 24px

    flex 1
    justify-content space-between

  &>b
    &>b
      :global(a)
        color #888

      :global(a.n)
        color #555

      &>a:hover
        color #000
        filter btn-hover-filter

@layer
  nav :global(m-c), nav>i
    background 50% 50% / 18px no-repeat
    border-radius 16px
    display inline-block
    height 29px
    opacity 0.4
    transition opacity 0.5s
    width 36px

    &.w
      background var(--svgWait) 50% 50% / 30px

    &:hover
      filter invert(42%) sepia() saturate(47)
      opacity 1

  nav>b.T>b:last-child
    &>:global(aside)
      align-items center
      display flex
      height 100%

    &>:global(aside>i), &>:global(aside>m-c)
      display flex
      margin-right 24px

  nav
    :global(b)
      align-items center
      display flex
      height 100%

    &>i
      background var(--svgSide) 50% 50% / 20px no-repeat
      border 1px solid #000
      cursor pointer
      display none
      opacity 0.4

      &:hover
        filter btn-hover-filter
        opacity 1

@media (min-width 701px)
  nav>b.T>b:last-child
    &>:global(aside)
      margin-right -24px

@media (max-width 700px)
  nav
    &>b :global(b)
      height auto

    &>i
      display block

    :global(&>b.T>b>a), :global(&>b.T>b>b), :global(&>b.T>b>aside>i), :global(&>b.T>b>aside>m-c), :global(&>b.T>b>i)
      display none

    :global(&.S>b.T>b>a), :global(&.S>b.T>b>b), :global(&.S>b.T>b>aside>i), :global(&.S>b.T>b>aside>m-c), :global(&.S>b.T>b>i)
      display flex

    :global(&.S>i)
      background #000
      border 0
      border-radius 0 !important
      cursor e-resize
      filter none
      height 100dvh !important
      left 0
      opacity 0.4
      position absolute
      top 0
      width 100% !important
      z-index 2

    :global(&.S>b.T>b)
      &:last-child
        border-bottom 1px solid #eee
        box-sizing border-box
        justify-content space-between
        margin 0
        padding 12px 24px
        width 100%

      &:first-child
        flex 1
        flex-direction column
        justify-content center

    :global(&.S>b.T>b:first-child>a), :global(&.S>b.T>b:first-child>b)
      margin 12px 0

    :global(&.S>b.T)
      background #fff
      box-shadow #999 0 0 5px
      display flex
      flex-direction column-reverse
      height 100dvh
      justify-content center
      position fixed
      right 0
      top 0
      width 330px
      z-index 9
</style>

