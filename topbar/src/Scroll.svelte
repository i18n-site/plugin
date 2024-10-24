<script lang="coffee">
> @8p/scroll:Scroll
  ./topfix.js

< R

onMount =>
  topfix R
</script>

<template lang="pug">
Scroll(bind:R=R)
  slot
</template>

<style lang="stylus"></style>

