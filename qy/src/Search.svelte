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
  input(@&I placeholder:>qHolder)
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
    height 48px
    width 48px

  input, m-c
    transition all 0.3s

  m-c
    background-image var(--svgQ)
    border-radius 24px
    height 48px
    margin 0
    overflow hidden
    width 48px

@media (max-width 1100px)
  form
    input
      width 150px

@media (max-width 800px)
  form
    input
      display none

@media (max-width 700px)
  form
    border none

    input
      display none

    m-c
      background-image var(--svgQm)
      background-position 2px 3px
      border 2px solid #000
      border-radius 12px
      height 24px
      opacity 0.5
      width 24px

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

