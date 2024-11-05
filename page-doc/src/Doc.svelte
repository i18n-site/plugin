<script lang="coffee">
> @8p/md/MdTxt.svelte
  @8p/base-toc/BaseToc.svelte
  @8p/wait:Wait
  svelte > tick
  x/_.js > fJson

+ M, md

A = [
  # set
  (_md)=>
    md = _md
    await tick()
    return M
  # 返回是否应该高亮链接
  (pathname)=>1
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

