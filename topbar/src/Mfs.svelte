<script lang="coffee">
> @8p/mfs/Mfs.svelte
  ./topfix.js

+ R
< C

onMount =>
  topfix(R)
</script>

<template lang="pug">
Mfs(bind:R=R)
  <svelte:component this="{C}"/>
</template>

<style lang="stylus"></style>

