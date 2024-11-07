<script lang="coffee">
> @8p/mc:Mc
  @8p/md/MdTxt.svelte
  @8p/shash
  @8p/toc:Toc
  @8p/topbar/Scroll.svelte
  @8p/wait:Wait
  @8p/side:Side
  x/_.js > fMd
  @8p/toclib/toc.js
  svelte > tick

+ md,S,M,A

onMount =>
  md = await fMd location.pathname.slice(1)
  await tick()
  A = toc S,M
  return shash(S)
</script>

<template lang="pug">
+if md != undefined
  Scroll(bind:R=S)
    +if A
      Side
        Toc(A:)
    b
      Mc
        MdTxt(bind:R=M md:md)
      i-h.F(data-h="foot")
  +else
    Wait
</template>

<style lang="stylus">
@import '@8p/side/sideB.styl'
</style>

