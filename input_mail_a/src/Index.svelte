<script lang="coffee">
< mail

+ href
onMount =>
  href = '//'+mail.split('@').pop()
  return
</script>

<template lang="pug">
u
  label
    slot
  a(href: tabindex="-1") {mail}
</template>

<style lang="stylus">
@import '~/styl/var.styl'

u
  background #eee
  border 1px solid #ccc
  display flex
  flex-direction row
  padding 16px

  &>a
    border-bottom 1px solid #000
    color #000
    margin-bottom -3px
    margin-left 16px
    padding-bottom 6px

    &:hover
      border-color hover-color
      color hover-color
</style>

