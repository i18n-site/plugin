<script lang="coffee">
</script>

<template lang="pug">
main
  slot
</template>

<style lang="stylus">
main
  align-items center
  box-sizing border-box
  display block
  justify-content center
  margin auto
  max-width 800px
  overflow hidden
  padding 0 24px 0 54px
  position relative

@media (max-width 950px)
  main
    padding-left 26px

@media (max-width 870px)
  main
    max-width 100%

@media (max-width 560px)
  main
    padding 0 20px
</style>
