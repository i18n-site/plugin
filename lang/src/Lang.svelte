<script lang="coffee">
> x/lang.js > set:langSet onSet
  @3-/fall
  @3-/minw
  x/On.js
  svelte > tick
  @2-/doc/HTM.js

W = 'w'

NOW = HTM.lang

+ e, d, b

onMount =>
  e.classList.remove W
  + unbind
  hide = =>
    unbind?()
    if d
      d = 0
    return
  fall(
    On(
      window
      resize:hide
    )
    onSet (lang)=>
      NOW = lang
      return
    On(
      e
      click:=>
        d = !d
        if d
          setTimeout(
            =>
              unbind?()
              unbind = On(
                document.body
                click: hide
              )
              return
          )
          await tick()
          maxHeight = document.body.clientHeight * 0.7 - 23
          rect =  b.getBoundingClientRect()
          if rect.height > maxHeight
            sum = 0
            n = 0
            ali = b.getElementsByTagName('a')
            for i from ali
              sum += i.clientWidth
              ++n
            area = (sum + 7*(n-1)) * (7+ali[0].clientHeight)
            w =  Math.min(
              rect.right
              Math.round Math.max(
                Math.sqrt(area) + 70
                area / maxHeight
              )
            )
            b.style="width:#{w}px;flex-wrap:wrap;flex-direction:row-reverse;z-index:1"
            b.style.width = minw(b) + 2 +'px'
        return
    )
  )

c = (l)=>
  e.classList.add W
  NOW = l
  langSet l
  e.classList.remove W
  return
</script>

<template lang="pug">
i
  m-c.w(title:>lang @&e)
  +if d
    b(@&b)
      +each _LANG as i
        a(@click={c(i[1])} class:n={i[1]==NOW}) {i[0]}
</template>

<style lang="stylus">
m-c
  background-image url('./lang.svg')

  &.w
    background-image var(--svgWait)
    background-size 30px

i
  font-style normal
  max-width 600px
  position relative

b
  background #fff
  border 1px solid #eee
  box-sizing border-box
  flex-direction column
  font-size 14px
  justify-content space-between
  padding 14px 14px 7px 21px
  position absolute
  right -18px
  top 30px

  &>a
    border-bottom 1px dashed #ccc
    color #666
    cursor pointer
    margin 0 7px 7px 0
    user-select none
    white-space nowrap

    &.n
      border-bottom 2px solid #000
      color #000
      font-weight 600

    &:hover
      border-color #f40
      color #f40

@media (max-width 560px)
  i
    position static

  b
    margin-top 16px
    right 8px

@media (max-width 400px)
  b
    &>a
      font-size 12px
      margin 0 4px 4px 0
</style>
