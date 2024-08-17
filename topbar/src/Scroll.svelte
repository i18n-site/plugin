<script lang="coffee">
> @8p/scroll:Scroll
  ./fix.js

+ m

onMount =>
  fix(m)
</script>

<template lang="pug">
Scroll(@&m)
  slot
</template>

<style lang="stylus"></style>

