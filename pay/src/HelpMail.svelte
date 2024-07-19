<script lang="coffee">
</script>

<template lang="pug">
a(href="mailto:{_MAIL_HELP}")
  | >needHelp
  b >pleaseMail {_MAIL_HELP}
</template>

<style lang="stylus">
a
  color #999
  cursor pointer
  display flex
  font-size 14px
  justify-content center
  margin-top 32px

  &>b
    font-weight 300
    margin-left 6px

  &:hover
    color #f40

    &>b
      border-bottom 1px solid #f40
</style>

