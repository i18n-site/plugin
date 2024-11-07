<script lang="coffee">
> @8p/scroll:Scroll

< R

</script>

<template lang="pug">
Scroll(bind:R=R)
  i
    b
      slot
    i-h.F(data-h="foot")
</template>

<style lang="stylus">
i, b
  display flex
  flex 1

i
  align-items center
  flex-direction column
  font-style normal
  width 100%
</style>

