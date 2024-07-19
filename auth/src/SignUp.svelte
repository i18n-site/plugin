<script lang="coffee">
> ./Code.svelte
  x/user.js > setUser
  @2-/fp
  @5-/auth > auth authSignUp
  @8p/box/confirm.js
  ~/lib/I18N.js > _$created

< li

name = ''

resend = =>
  auth(
    await fp()
    0
    ...li
  )

done = (uid)=>
  setUser [uid, 0, , name]
  confirm ->
    @[_$created]
  return

submit = (args...)=>
  authSignUp(
    ... args
    name
  )
</script>

<template lang="pug">
include /input.pug
Code(done: li: resend: submit:)
  +input(">name")#name(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&name
  )
  button(type="submit") >signUp
</template>

<style lang="stylus"></style>
