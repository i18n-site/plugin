<script lang="coffee">
> ./Pure.svelte
</script>

<template lang="pug">
b
  h1 {_SITE_NAME}
  <Pure {...$$restProps}/>
</template>

<style lang="stylus">
@import '~/styl/util/h1Logo.styl'

b
  display flex
  flex-direction column
  padding 0 16px
</style>
