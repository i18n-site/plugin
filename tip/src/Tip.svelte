<script lang="coffee">
> x/On.js

+ b

onMount =>
  On(
    b
    click:=>
      b.nextElementSibling.style.display = 'block'
      setTimeout =>
        unbind = On(
          document
          click:=>
            b.nextElementSibling.removeAttribute 'style'
            unbind()
            return
        )
        return
      return
  )
</script>

<template lang="pug">
i
  b(@&b)
    slot
  i
    slot(name="t")
</template>

<style lang="stylus">
i
  font-style normal
  position relative

  &>i
    background #fff
    border 1px solid #ccc
    bottom 32px
    display none
    font-size 14px
    padding 14px
    position absolute
    right 0
    width 200px
    z-index 100

    &:before, &:after
      border-style solid
      bottom -10px
      content ''
      height 0
      position absolute
      right 3px
      width 0

    &:before
      border-color #ccc transparent transparent transparent
      border-width 10px 5px 0 5px

    &:after
      border-color #fff transparent transparent transparent
      border-width 9px 4px 0 4px
      bottom -8px
      right 4px

  &>b
    cursor pointer
    user-select none

    &:hover+i
      display block
</style>

