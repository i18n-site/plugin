<script lang="coffee">
< send
< state = 0

+ timeout

timer = =>
  timeout = setTimeout(
    =>
      state = 1
      return
    3e4
  )
  return

onMount =>
  timer()
  return

:$
  if state == 2
    clearTimeout timeout

_send = =>
  state = 0
  timer()
  send()
  return

</script>

<template lang="pug">
+if state
  b
    +if state == 1
      b >notRecv
    a(@click=_send) >resend
</template>

<style lang="stylus">
b
  display flex
  flex-wrap wrap
  font-weight bold
  justify-content flex-end

  &>a
    border-bottom 2px solid
    margin-left 6px
    padding-bottom 3px
    white-space nowrap
</style>

