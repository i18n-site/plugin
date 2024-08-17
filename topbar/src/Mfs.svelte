<script lang="coffee">
> @8p/mfs/Mfs.svelte
  ./fix.js

+ m

onMount =>
  fix(m)
</script>

<template lang="pug">
Mfs(@&m)
  slot
</template>

<style lang="stylus"></style>

