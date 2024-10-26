<script lang="coffee">
> @8p/tip:Tip

</script>

<template lang="pug">
p
  b >autoChargeTip
  Tip
    b.p(slot="t")
      b >autoChargeHelp
    i ?
</template>

<style lang="stylus">
p
  align-items center
  display flex
  justify-content space-between
  margin 0
  padding 20px 0
  width 100%

  &>b
    align-items center
    display flex
    font-size 15px
    font-weight 300
    margin-right 16px
    max-width 300px

    &>label
      margin-left 6px

  i
    border 1px solid #000
    border-radius 12px
    display block
    font-size 16px
    font-style normal
    line-height 21px
    padding 0 9px
    text-align center
    transform scale(0.7)
    transform-origin 100% 50%

b.p
  display flex
  flex-direction column

  &>b
    margin-top 6px

  &>b:first-child
    margin-top 0
</style>
