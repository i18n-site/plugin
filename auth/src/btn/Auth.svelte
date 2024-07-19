<script lang="coffee">
> @8p/menu
  ../auth.js > signUp signIn
  x/user.js > onUser
  ./Menu.svelte

+ id, user

onUser (_)=>
  user = _
  return

click = menu(
  Menu
)
</script>

<template lang="pug">
+if user
  b
    a.u(@click) { user[3] }
  +else
    i
      a(@click=signUp) >signUp
      | ⧸
      a(@click=signIn) >signIn
</template>

<style lang="stylus">
@import '~/styl/var.styl'
@import '@8p/menu/wrap.styl'

i
  align-items center
  border-radius 0 !important
  display flex
  font-style normal
  width auto !important

  &>a
    color #000
    margin 0 12px

    &:first-child
      margin-left 0

    &:last-child
      margin-right 0

    &:hover
      color btn-hover

b, i
  align-self stretch
  border-left 1px solid #eee
  color #ccc
  padding-left 24px

b
  &>:global(b)
    margin-right -1px

@media (max-width 560px)
  b
    &>:global(b)
      margin 0 -17px 0 0
</style>

