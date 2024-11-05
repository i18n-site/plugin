<script lang="coffee">
> ./Toc.svelte
  x/isPrefix.js
  x/_.js > fd
  @8p/mc:Mc
  @8p/side:Side
  @8p/topbar/Scroll.svelte
  @8p/wait:Wait
  svelte > tick

+ S,ARG

< A

[set,doRender,fToc] = A

onMount =>
  pathname = location.pathname.slice(1)

  for [prefix, _, _ver] from _P
    if isPrefix prefix,pathname
      ver = _ver
      break

  if not prefix # the last prefix is ''
    ver = 0
    li = pathname.split('/')
    prefix = ''
    while li.length
      t = li.join('/')
      if await fd('md',t)
        prefix = t
        li.pop()
      else
        break

  ARG = [
    # set
    (md)=>
      [
        S
        await set(md)
      ]
    # toc
    await fToc(prefix)
    # ver
    ver
    doRender
  ]
  return


</script>

<template lang="pug">
+if ARG != undefined
  Scroll(bind:R=S)
    Side
      Scroll
        Toc(A:ARG)
    b
      Mc
        slot
      i-h.F foot
  +else
    Wait
</template>

<style lang="stylus">
@import '@8p/side/sideB.styl'
</style>

