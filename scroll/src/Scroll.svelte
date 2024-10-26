<template lang="pug">
b.scroll(@&R)
  div
    .m(@&m)
      slot
  +if BAR
    <svelte:component this="{BAR}" b={R} m={m}/>
</template>


<script lang="coffee">
> @2-/has_mouse:HAS_MOUSE

< R
+ m, BAR

onMount =>
  if HAS_MOUSE
    BAR=(await import('./Bar.svelte')).default
  return

`export { m as main}`

</script>

<style lang="stylus">
b
  display flex
  overflow auto
  scrollbar-width none
  -ms-overflow-style none

b>div
  height 100%
  margin auto
  position absolute
  width 100%

b>div>div
  align-items center
  display flex
  flex-direction column
  min-height 100%
  width 100%
</style>
