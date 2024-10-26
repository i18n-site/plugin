<script lang="coffee">
> @8p/mfs/Mfsh.svelte
  ./topfix.js

+ R

onMount =>
  topfix R
</script>

<template lang="pug">
Mfsh(bind:R=R)
  slot
</template>

<style lang="stylus"></style>

