<script lang="coffee">
> @2-/errer
  ./passwd.js
  @2-/pbox

< account

+ form

submit = =>
  li = [
    ...form.getElementsByTagName 'input'
  ].map (i)=>i.value
  if null != await errer(
    form
    passwd li
  )
    pbox(form).close()
  return

</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=submit)
  +input(">mail")#account(
    autocomplete="username"
    placeholder=" "
    required
    type="text"
    value&account
  )
  +input(">setPassword")#password(
    autocomplete="off"
    minlength="6"
    placeholder=" "
    required
    type="password"
  )
  button(type="submit") >resetPassword
</template>

<style lang="stylus">
form
  padding 26px 26px 23px

  button
    width 100%
</style>
