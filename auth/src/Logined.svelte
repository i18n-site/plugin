<script lang="coffee">
> x/user.js > User
  ./Auth.svelte
  @8p/wait:Wait
  svelte > tick

< s

+ uid,m

onMount =>
  user = User()
  if user
    [_uid] = user
    if (not uid) or uid != _uid
      uid = _uid
      m = Wait
      await tick()
      m = s
    else
      m = s
  else
    m = 0
  return

</script>

<template lang="pug">
+if m
  <svelte:component this="{m}"/>
  +else
    b
      Auth
</template>

<style lang="stylus">
b
  border 0.5em solid #f2f2f2
  margin auto
  max-width 500px
  min-width 310px
  position relative

  &:before
    border 1px solid #ccc
    box-shadow 0 0 0.25em #eee
    content ''
    height 100%
    left 0
    pointer-events none
    position absolute
    top 0
    width 100%
    z-index 1
</style>
