<script lang="coffee">
> ./MdTxt.svelte
  @8p/wait:Wait
  x/_.js > fMd

< url

+ md

onMount =>
  md = await fMd url
  return
</script>

<template lang="pug">
+if md == undefined
  Wait
  +else
    MdTxt(md:)
</template>

<style lang="stylus"></style>
