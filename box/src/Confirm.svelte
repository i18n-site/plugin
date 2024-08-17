<script lang="coffee">
htm = ''

< gen

onI18n ->
  h = await gen.call @
  if not h.startsWith '<'
    h = "<h2>#{h}</h2>"
  htm = h
  return

x = ->
  @parentNode.close()
  return
</script>

<template lang="pug">
b
  | {  @html htm  }
button(@click=x) >ok
</template>

<style lang="stylus">
button
  width 100%

b :global(h2)
  margin 16px
  text-align center
</style>
