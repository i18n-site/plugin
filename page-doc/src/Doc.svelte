<script lang="coffee">
> @8p/md/MdTxt.svelte
  @8p/base-toc/BaseToc.svelte
  @8p/wait:Wait
  x/isPrefix.js
  svelte > tick
  x/_.js > fJson

+ M, md

A = [
  # set
  (_md)=>
    md = _md
    await tick()
    return M
  # init
  (ali, pathname)=>
    for i from ali
      p = i.pathname.slice(1)
      if isPrefix pathname,p
        return [p,i]
    return
  # fToc
  (prefix)=>
    fJson prefix+'/_'
]
</script>

<template lang="pug">
BaseToc(A:)
  +if md != undefined
    MdTxt(bind:R=M md:md)
    +else
      Wait
</template>

<style lang="stylus"></style>

