<script lang="coffee">
> @~3/menu
  ../auth.js > signUp signIn
  ../onUser.js
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
b
  +if user
    a.u(@click) {user[3]}
    +else
      a(@click=signUp) >signUp
      | ⧸
      a(@click=signIn) >signIn
</template>

<style lang="stylus">
@import '~/styl/var.styl'

b
  align-self stretch
  border-left 1px solid #eee
  color #ccc
  margin-left 24px
  padding-left 24px
  position relative

  &>:global(b)
    margin-top -15px

  &>a
    color #000
    margin 0 12px
    opacity 0.625

    &:first-child
      margin-left 0

    &:last-child
      margin-right 0

    &:hover
      color btn-hover

    &.u
      background var(--svgNabla) 100% 56% no-repeat
      border-bottom solid transparent
      margin 0 0 -3px
      padding 0 16px 3px 0

      &:hover
        border-bottom-color btn-hover
        filter btn-hover-filter
        opacity 1
</style>

