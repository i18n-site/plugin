<script lang="coffee">
</script>

<template lang="pug">
h3
  slot
</template>

<style lang="stylus">
h3
  border-bottom 1px solid #000
  display flex
  justify-content space-between
  margin 0
  min-width 300px
  padding 0 0 14px

  &>:global(a)
    color #000
    margin-left 16px

    &:last-child
      border 2px solid #f40
      color #f40
      font-size 17px
      font-variation-settings 'wght' 500, 'BEVL' 30
      padding 3px 13px 2px

      &:hover
        background-color #f40
        color #fff

  &>:global(i)
    font-style normal

  &>:global(i>a)
    color #000
    margin-right 16px
    padding-bottom 20px

    &.n
      border-bottom 6px solid #000

    &:hover
      border-color #f40
      color #f40
</style>

