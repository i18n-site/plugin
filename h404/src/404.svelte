<style lang="stylus">
$l-purple = #fff
$color = #fc0
$eye = #333

.W
  display flex
  flex-flow column
  margin auto
  user-select none

  h1, .box
    margin auto

  h1
    color $color
    font-size 3rem
    margin-bottom 6rem

p, .box__ghost-container
  animation upndown 3s ease-in-out infinite

.box
  .box__ghost
    left 50%
    padding 1rem 2rem
    position relative
    top 50%
    transform translate(-50%, -30%)

    .symbol
      &:nth-child(1)
        animation shine 4s ease-in-out 3s infinite
        opacity 0.2

        &:before, &:after
          background $color
          border-radius 5px
          bottom 65px
          content ''
          height 4px
          left 0
          position absolute
          width 12px

        &:before
          transform rotate(45deg)

        &:after
          transform rotate(-45deg)

      &:nth-child(2)
        animation shine 4s ease-in-out 1.3s infinite
        border 4px solid
        border-color $color
        border-radius 50%
        height 18px
        left -5px
        opacity 0.2
        position absolute
        top 30px
        width 18px

      &:nth-child(3)
        animation shine 3s ease-in-out 0.5s infinite
        opacity 0.2

        &:before, &:after
          background $color
          border-radius 5px
          content ''
          height 4px
          left 40px
          position absolute
          top 5px
          width 12px

        &:before
          transform rotate(90deg)

        &:after
          transform rotate(180deg)

      &:nth-child(4)
        animation shine 6s ease-in-out 1.6s infinite
        opacity 0.2

        &:before, &:after
          background $color
          border-radius 5px
          content ''
          height 4px
          position absolute
          right 30px
          top 10px
          width 15px

        &:before
          transform rotate(45deg)

        &:after
          transform rotate(-45deg)

      &:nth-child(5)
        animation shine 1.7s ease-in-out 7s infinite
        border 3px solid
        border-color $color
        border-radius 50%
        height 12px
        opacity 0.2
        position absolute
        right 5px
        top 40px
        width 12px

      &:nth-child(6)
        animation shine 2s ease-in-out 6s infinite
        opacity 0.2

        &:before, &:after
          background $color
          border-radius 5px
          bottom 65px
          content ''
          height 4px
          position absolute
          right -5px
          width 15px

        &:before
          transform rotate(90deg)

        &:after
          transform rotate(180deg)

    .box__ghost-container
      background $color
      border-radius 100px 100px 0 0
      height 100px
      margin 0 auto
      position relative
      width 100px

      .box__ghost-eyes
        // transform: translate(-50%, -45%);
        height 12px
        left 50%
        position absolute
        top 45%
        width 70px

        .box__eye-left
          background $eye
          border-radius 50%
          height 12px
          left 0
          margin 0 10px
          position absolute
          width 12px

        .box__eye-right
          background $eye
          border-radius 50%
          height 12px
          margin 0 10px
          position absolute
          right 0
          width 12px

      .box__ghost-bottom
        display flex
        left 0
        position absolute
        right 0
        top 100%

        div
          background-color $color
          border-radius 100%
          flex-grow 1
          height 20px
          position relative
          top -10px

          &:nth-child(2n)
            background transparent
            border-top 15px solid $l-purple
            margin 0
            top -12px

    .box__ghost-shadow
      animation smallnbig 3s ease-in-out infinite
      border-radius 50%
      box-shadow 0 50px 15px 5px #aaa
      height 20px
      margin 0 auto

// keyframes
@keyframes upndown
  0%
    transform translateY(5px)

  50%
    transform translateY(15px)

  100%
    transform translateY(5px)

@keyframes smallnbig
  0%
    width 90px

  50%
    width 100px

  100%
    width 90px

@keyframes shine
  0%
    opacity 0.3

  25%
    opacity 0.1

  50%
    opacity 0.3

  100%
    opacity 0.3
</style>
<template lang=pug>
.W
  h1 >notFound
  .box
    .box__ghost
      .symbol
      .symbol
      .symbol
      .symbol
      .symbol
      .symbol
      .box__ghost-container
        .box__ghost-eyes(@&eye)
          .box__eye-left
          .box__eye-right
        .box__ghost-bottom
          div
          div
          div
          div
          div
      .box__ghost-shadow
</template>

<script lang="coffee">
> x/On.js
  @2-/title
  @2-/doc/HTM.js

+ eye

onMount =>
  title notFound$
  pageX = HTM.offsetWidth
  pageY = HTM.offsetHeight
  mouseY=0
  mouseX=0
  On(
    HTM
    mousemove: (event) =>
      mouseY = event.pageY
      mouseX = event.pageX / -pageX
      yAxis = -(pageY/2-mouseY)/pageY*400 - 100
      xAxis = -mouseX * 100 - 100
      eye.style = "transform:translate(#{xAxis}%,#{yAxis}%)"
      return
  )
</script>
