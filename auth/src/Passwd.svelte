<script lang="coffee">
> ./Code.svelte
  x/user.js > setUser
  @5-/auth > authPasswd:submit authReset
  @8p/box/done.js:boxDone

< li

resend = =>
  authReset(
    ...li
  )

done = (user)=>
  setUser user
  boxDone()
  return

</script>

<template lang="pug">
include /input.pug
Code(done: li: resend: submit:)
  button(type="submit") >setPassword
</template>

<style lang="stylus"></style>
