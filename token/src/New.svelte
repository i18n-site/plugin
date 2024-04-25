<script lang="coffee">
< add

+ val,form

submit = =>
  add val.trim()
  form.parentNode.close()
  return
</script>

<template lang="pug">
include /input.pug
form(@submit|preventDefault=submit @&form)
  h2 >apiToken
  +input(">name")(
   value&val
   placeholder=" "
   required
   type="text"
  )
  button(type="submit") >create
</template>

<style lang="stylus">
button
  width 100%
</style>
