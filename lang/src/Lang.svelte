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
          {
            clientHeight
            clientWidth
          } = document.body
          maxHeight = clientHeight * 0.6 - 23
          rect =  b.getBoundingClientRect()
          if rect.height > maxHeight
            sum = 0
            n = 0
            ali = b.getElementsByTagName('a')
            for i from ali
              sum += i.clientWidth
              ++n
            area = (sum + 7*(n-1)) * (7+ali[0].clientHeight)
            w = Math.min(
              clientWidth - 18
              Math.round Math.max(
                Math.sqrt(area) + 70
                area / maxHeight
              )
            )
            b.style="width:#{w}px;flex-wrap:wrap;flex-direction:row-reverse;z-index:1"
            minw(b)
            rect = b.getBoundingClientRect()
            if rect.right > clientWidth
              b.style.marginLeft = -(rect.right - clientWidth + 9)+'px'
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
  height auto
  justify-content space-between
  left -48px
  padding 7px 4px 5px 10px
  position absolute
  top 30px

  &>a
    border-bottom 1px dashed #ccc
    color #666 !important
    cursor pointer
    font-family s
    font-variation-settings 'wght' 320
    margin 0 6px 6px 0
    user-select none
    white-space nowrap

    &.n
      border-bottom 2px solid #000
      color #000 !important
      font-variation-settings 'wght' 600

    &:hover
      border-color #f40

@media (max-width 560px)
  b
    box-sizing border-box

    &>a
      font-size 14px

@media (max-width 400px)
  b
    &>a
      font-size 12px
      margin 0 2px 1px 0
</style>
