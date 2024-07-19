<script lang="coffee">
> ./Toc.svelte
  x/isPrefix.js
  @8p/h404:H404
  x/_.js > fJson fd
  @8p/mc:Mc
  @8p/md/MdTxt.svelte
  @8p/side:Side
  @8p/topbar/Scroll.svelte
  @8p/wait:Wait
  svelte > tick

+ S,M,md,A

onMount =>
  pathname = location.pathname.slice(1)

  for [prefix, _, _ver] from _P
    if isPrefix prefix,pathname
      ver = _ver
      break

  do =>
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

    A = [
      # set
      (_md)=>
        md = _md
        await tick()
        return [S,M]
      # toc
      await fJson prefix+'/_'
      # ver
      ver
    ]
    return
  return


</script>

<template lang="pug">
+if A != undefined
  +if A
    Scroll(@&S)
      Side
        Scroll
          Toc(A:)
      b
        Mc
          +if md != undefined
            MdTxt(@&M md:md)
            +else
              Wait
        i-h.F foot
    +else
      H404
  +else
    Wait
</template>

<style lang="stylus">
@import '@8p/side/sideB.styl'
</style>

