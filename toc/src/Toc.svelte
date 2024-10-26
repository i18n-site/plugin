<script lang="coffee">
> @8p/toclib/T.svelte
  @8p/topbar/Scroll.svelte
  @8p/toclib/scrollSync.js

# [toc, scroll]
< A

+ b

onMount =>
  scrollSync(
    b
    b.getElementsByTagName('a')
    ...A
  )

</script>

<template lang="pug">
Scroll
  b(@&b)
    T(A:A[0])
</template>

<style lang="stylus">
b>:global(b>li)
  margin 0

b>:global(b>i)
  display block
  text-align center

b>:global(b>i>a)
  padding 24px 0 8px

b>:global(b>i>a)
  font-size 16px

b
  box-sizing border-box
  display block
  padding 0 24px 24px
</style>

