<script lang="coffee">
> @8p/box
  @2-/new:New
  @2-/watch
  x/On.js
  ./Q.svelte

+ I

submit = =>
  {
    value:v
  } = I
  I.value = ''
  [
    b
  ] = box(
    Q
    {
      v
    }
  )

  b.classList.add('Q')
  return

onMount =>
  setTimeout =>
    I.focus()
    return

  watch(
    I
    =>
      I.value = I.value.trimStart()
      if I.value
        submit()
      return
  )
</script>

<template lang="pug">
form(@submit|preventDefault=submit)
  input(type="text" @&I placeholder:>qHolder)
  m-c
    button(title:>search type="submit")
</template>

<style lang="stylus">
form
  align-self stretch
  border 1px solid #eee
  border-width 0 1px 0 1px
  flex-direction row
  flex-wrap nowrap
  margin-right 24px
  position relative

  input, button
    border 0

  input
    padding 17px 0 17px 16px
    width 250px

  button
    background transparent
    box-shadow none

  input, m-c
    transition all 0.3s

  m-c
    background-image var(--svgQ)
    margin 0
    overflow hidden

@media (max-width 1100px)
  form
    input
      width 150px

@media (max-width 800px)
  form
    input
      display none

@media (min-width 701px)
  button, m-c
    border-radius 24px !important
    height 48px !important
    width 48px !important

@media (max-width 700px)
  form
    border none

    input
      display none

    m-c
      background var(--svgQm) 50% 50% / 16px no-repeat
      border 1px solid #000
      border-radius 12px
      height 24px
      opacity 0.4
      width 30px

      &:hover
        opacity 1

:global(body>nav.S>b>b>form)
  display none

:global(body>dialog.Q)
  max-width 100%
  top -50px

@media (max-width 750px)
  :global(body>dialog.Q)
    width calc(100% - 32px)
</style>

