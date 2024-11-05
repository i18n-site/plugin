<script lang="coffee">
< A
</script>

<template lang="pug">
+each A as i
  +if Array.isArray(i)
    +if Array.isArray(i[1])
      b
        +if Array.isArray(i[0])
          a(href:i[1])
            b { i[0] }
            i
          +else
            b { i[0] }
        li
          svelte:self(A:i[1])
      +else
        b
          a(href:i[1])
            b { i[0] }
            i
    +else
      b { i }
</template>

<style lang="stylus">
@import '@8p/toclib/toc.styl'
@import '~/styl/var.styl'

b
  color #ccc

b:has(+li), b:has(>a), a>b
  color #666

a
  display flex

  &>b
    border 1px solid transparent
    max-width 293px
    overflow hidden
    text-overflow ellipsis
    white-space nowrap

  &>b, &>i:after
    transition all 0.3s

  & > i
    cursor pointer
    flex 1
    margin-left 6px
    min-width 20px
    position relative

    &:before, &:after
      content ''
      position absolute
      top 50%

    &:before
      background var(--svgHline) 0 55% / 600px repeat-x
      height 1px
      left 0
      opacity 0.4
      right 16px

    &:after
      background var(--svgArrow) 50% 90% / 24px no-repeat
      border 1px solid #333
      border-radius 14px
      height 28px
      margin-top -14px
      opacity 0.6
      right 0
      transform scale(0.5)
      transform-origin 100% 50%
      width @height

  &:hover
    &>b
      color #00f

    &>i
      &:before
        filter a-hover-filter
        opacity 1

      &:after
        filter a-hover-filter
        opacity 1

b>:global(a.N>b)
  background #fffff0
  border-color #cce
  border-radius 6px
  box-shadow #9ea 0 0 3px inset
  padding 0 6px

b>:global(a.N:hover>b)
  background #f0ffff
  box-shadow #ccf 0 0 3px inset

b>:global(a.N>i)
  &:after
    transform scale(0.5) rotate(270deg)
    transform-origin 67% 37%

b>:global(a.N:has(+b)>i)
  &:after
    transform scale(0.5) rotate(180deg)
    transform-origin 68% 50%

b>:global(a.W:hover>i)
  &:after
    filter none

b>:global(a+b)
  display block
  padding-left 21px
  position relative

  &:before
    background var(--svgDv) 0 0 repeat-y
    bottom 10px
    content ''
    left 7px
    position absolute
    top 10px
    width 1px

b>:global(a.S+b)
  display none

b>:global(a.S:has(+b)>i), b>:global(a.S:has(+b):hover>i)
  &:after
    background var(--svgArrow) 50% 90% / 24px no-repeat
    height 28px
    margin-top -14px
    transform scale(0.5)
    transform-origin 100% 50%
    width @height

b>:global(a.W>i)
  &:after
    background var(--svgWait) no-repeat -1px -1px / 18px
    border-color transparent
    filter none
    height 18px
    margin-right -3px
    margin-top -8px
    opacity 1
    transform scale(1) !important
    width @height
</style>

