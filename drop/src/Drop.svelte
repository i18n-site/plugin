<script lang="coffee">
> @8p/menu

< A

drop = menu ...A
</script>

<template lang="pug">
<a on:click={drop} {...$$restProps}/>
</template>

<style lang="stylus">
@import '~/styl/var.styl'

a
  background var(--svgNabla) 60% 81% / 8px no-repeat
  border 2px solid #000
  border-radius 16px
  cursor pointer
  height 14px
  width 14px

  &:hover
    filter btn-hover-filter
</style>

