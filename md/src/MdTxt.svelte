<script lang="coffee">
> @2-/tag0
  @2-/title/seth1.js
  @3-/mark
  @8p/wait:Wait
  @8p/h404:H404
  svelte > tick

< md
< R

+ h

onMount =>

  if md != 0
    md = md.replaceAll('\r\n','\n').trimStart()
    if md.startsWith('---\n')
      end = md.indexOf('---\n',4)
      if ~end
        md = md.slice(end+4)

    try
      h = mark(md)
      await tick()
      return seth1(R) # unmount
    catch err
      h = ''+err
  return
</script>

<template lang="pug">
+if md === 0
  H404
  +elseif h !== undefined
    b.m(@&R)
      | { @html h }
</template>

<style lang="stylus">
// wait for fix https://github.com/stylus/stylus/issues/2890
b.m
  display block

  :global(a)
    display inline-block
    position relative

    &:after
      background-color #fff
      bottom -3px
      content ''
      height 1px
      left 0
      opacity 0
      position absolute
      transition all 1s ease
      width 0

    &:hover
      &:after
        background-color #00f
        opacity 1
        width 100%

  :global(ul:has(li>input))
    list-style none
    margin 0
    padding 0

  :global(ul>li>input)
    display inline-block
    margin-right 6px
    vertical-align -3px

  :global(code)
    margin 0 3px
    vertical-align 2px

  :global(pre>code)
    margin 0
    vertical-align 0

  :global(ul)
    list-style none

  :global(ul>li>ul>li:before)
    opacity 0.8

  :global(ul>li>ul>li>ul>li:before)
    opacity 0.6

  :global(li ol), :global(li ul)
    margin 8px 0 8px 35px

  :global(li:has(>input[type=checkbox]))
    &:before
      content none

@media (max-width 950px)
  b.m
    :global(ol)
      margin-left 2.25rem

    :global(ul)
      margin-left 1.625rem

    :global(ul li:before)
      margin-left -1.45rem

    :global(details>ul)
      margin-left 2.5rem

    :global(details>ol)
      margin-left 3rem

@media (max-width 560px)
  b.m
    :global(ul)
      margin-left 1.25rem

    :global(ul li:before)
      margin-left -1.25rem
</style>
