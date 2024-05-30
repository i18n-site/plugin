<script lang="coffee">
> @8p/scroll:Scroll

< scroll

</script>

<template lang="pug">
Scroll(@&scroll)
  i
    b
      slot
    i-h foot
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

