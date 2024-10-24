<script lang="coffee">
> ./Mfs.svelte
  @8p/shash

+ R

onMount =>
  shash R
</script>

<template lang="pug">
Mfs(bind:R=R)
  slot
</template>

<style lang="stylus"></style>

