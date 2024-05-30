<template lang="pug">
nav(@&nav)
  b
    //- 目录按钮的容器
  i(@click=bS)
    //- 手机视图下切换显示侧栏的按钮
  b
    b
      +if L
        +each L as i
          +if Array.isArray(i[1])
            <svelte:component this="{i[0]}" A={i[1]}/>
            +else
              a(href:i[1]) { i[0] }
        +else
          i.w
    b
      slot
</template>


<script lang="coffee">
> ./topfix.js > set
  @2-/pa/epa.js
  @2-/route/hashchange.js
  @3-/fall
  @3-/is_prefix:isPrefix
  x/On.js
  x/langSite.js
  x/_.js > NAV

+ L, nav, U, A_LI

bS = ->
  S = 'S'
  if @classList.toggle S
    p = location.pathname
    U = On(
      @nextSibling
      click: (e)=>
        e = epa e
        if e
          ep = e.pathname
          if ep and ep != p
            U()
            @classList.remove S
        return
    )
  else
    U()
  return

classNow = =>
  now = 'n'
  li = [...A_LI]

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
        =>
          li = nav.children
          # 预取,防止下拉菜单动态添加了A
          A_LI = [
            ...li[
              li.length-1 # children 不是数组, 不能用 pop()
            ].firstChild.getElementsByTagName('a')
          ]
          classNow()
          return
      )
      return
    On(
      window
      hashchange:classNow
    )
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

  :global(b)
    align-items center
    display flex

  &>i+b
    &>b:first-child
      &>a, &>:global(b)
        margin-right 24px

    flex 1
    justify-content space-between

  &>b
    &>b
      :global(a)
        color #888

      :global(a:hover)
        color #f40

      :global(a.n)
        color #555

nav>b:last-child>b>:global(i), nav :global(m-c), nav>i
  border-radius 12px
  height 24px
  width 24px

  &.w
    background var(--svgWait) 50% 50% / 30px

nav>b:last-child>b:last-child
  &>:global(i), &>:global(m-c)
    margin-left 24px

@layer
  nav>i
    background var(--svgSide) 50% 50% / 20px no-repeat
    border 2px solid #000
    cursor pointer
    display none
    opacity 0.5

    &:hover
      filter btn-hover-filter
      opacity 1

@media (max-width 560px)
  nav
    &>i
      display block

    &>i+b
      &>b
        &:last-child
          border-bottom 1px solid #eee
          box-sizing border-box
          justify-content space-between
          padding 0 24px
          width 100%

        &:first-child
          flex 1
          flex-direction column
          justify-content center

      background #fff
      box-shadow #999 0 0 5px
      display none
      flex-direction column-reverse
      height 100vh
      justify-content center
      position fixed
      right 0
      top 0
      width 250px
      z-index 9

      &>b
        &>a, &>:global(b), &>:global(i), &>:global(m-c)
          margin 12px 0 !important

    &>:global(i.S)
      background #000
      border 0
      border-radius 0 !important
      cursor e-resize
      filter none
      height 100vh !important
      left 0
      opacity 0.4
      position absolute
      top 0
      width 100% !important
      z-index 2

    &>:global(i.S+b)
      display flex !important

:global(m-c)
  background 50% 50% / 20px no-repeat
  border-radius 12px
  display inline-block
  height 24px
  opacity 0.5
  transition all 0.5s
  width 24px

  &:hover
    filter invert(42%) sepia() saturate(47)
    opacity 1
</style>

