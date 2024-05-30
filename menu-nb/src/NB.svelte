<script lang="coffee">
> @8p/menu
  ./Menu.svelte

< A

click = menu Menu,{A:A.slice(1)}
</script>

<template lang="pug">
b
  a(@click rev:A[1]) {A[0]}
</template>

<style lang="stylus">
@import '@8p/menu/wrap.styl'

b
  &>:global(b)
    right auto

@media (max-width 560px)
  b
    &>:global(b)
      max-width 325px
      overflow hidden
      right -32px

    &>:global(b>a>i)
      display inline-block
      max-width 302px
      overflow hidden
      text-overflow ellipsis
</style>

