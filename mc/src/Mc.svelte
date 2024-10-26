<script lang="coffee">
</script>

<template lang="pug">
main
  slot
</template>

<style lang="stylus">
main
  align-items center
  display flex
  justify-content center
  margin auto
  max-width 800px
  padding 0 24px 0 54px
  position relative

@media (max-width 950px)
  main
    padding-left 26px

@media (max-width 560px)
  main
    padding 0 20px
</style>
