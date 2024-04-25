<script lang="coffee">
> ./get.js
  @2-/tag0
  @2-/title
  @3-/mark
  @~3/h404
  @~3/wait:Wait
  svelte > tick

+ h,m

< arg

onMount =>
  [url] = arg
  md = await get url
  if md != 0
    h = mark md
    await tick()
    p = md.indexOf('# ')
    if ~p
      p+=2
      end = md.indexOf('\n', p)
      if end > 0
        h1 = md.slice(p, end)
        t = document.title
        title h1
        return =>
          title t
          return
  h = 0
  return
</script>

<template lang="pug">
+if h===undefined
  Wait
  +elseif h === 0
    h404
    +else
      b.m(@&m)
        | {  @html h  }
</template>

<style lang="stylus">
b.m
  display block

  :global(&>table)
    border 1px solid #ccc
    border-collapse collapse
    box-shadow 0 0 3px #ccc inset
    margin 1em 0
    text-align center
    width 100%

  :global(td), :global(tr)
    position relative

  :global(&>table tr:before), :global(&>table td:before)
    content ''
    opacity 0.3
    position absolute

  :global(&>table tr:before)
    background var(--svgHline) repeat-x
    height 1px
    left 0
    right 0

  :global(&>table td:before)
    background var(--svgVline) repeat-y
    bottom 0
    left 0
    top 0
    width 1px

  :global(&>table>thead)
    box-shadow 0 0 3px #ccc inset

  :global(&>table tr:first-child:before), :global(&>table td:first-child:before)
    background none

  :global(&>table>thead+tbody>tr:first-child)
    border-top 1px solid #ddd

  :global(&>table>tbody>tr>td), :global(&>table>thead>tr>th)
    border none
    padding 16px
</style>
