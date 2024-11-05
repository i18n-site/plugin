<script lang="coffee">
< A
</script>

<template lang="pug">
+each A as i
  +if Array.isArray(i[1])
    b
      i
        a(href:{'#'+i[0][1]}) { i[0][0] }
      li
        svelte:self(A:i[1])
    +else
      b
        a(href:{'#'+i[1]}) { i[0] }
</template>

<style lang="stylus">
@import '@8p/toclib/toc.styl'

b :global(a.A)
  color #000
  font-variation-settings 'wght' 600, 'BEVL' 30
  font-weight 800
</style>

