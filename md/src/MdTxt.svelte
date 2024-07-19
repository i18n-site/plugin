<script lang="coffee">
> @2-/tag0
  @2-/title/seth1.js
  @3-/mark
  @8p/wait:Wait
  @8p/h404:H404
  svelte > tick


< md

+ M,h

onMount =>
  if md != 0
    try
      h = mark md
      await tick()
      return seth1(M) # unmount
    catch err
      h = ''+err
  return
</script>

<template lang="pug">
+if md === 0
  H404
  +elseif h !== undefined
    b.m(@&M)
      | { @html h }
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

  :global(ul:has(li>input))
    list-style none
    margin 0
    padding 0

  :global(ul>li>input)
    display inline-block
    margin-right 6px
    vertical-align -3px

  :global(ul), :global(ul li), :global(ol), :global(ol li)
    padding 0
    white-space normal

  :global(code)
    margin 0 3px
    vertical-align 2px

  :global(pre>code)
    margin 0
    vertical-align 0

  :global(ul li), :global(ol li)
    margin 8px 0
    position relative

  :global(ul)
    list-style none

  :global(ul li:before)
    background #ffc
    border-radius 8px
    box-shadow 0 0 3px inset #666
    content ''
    height 8px
    margin-left -31px
    position absolute
    top 13px
    width 8px

  :global(ul>li>ul>li:before)
    opacity 0.8

  :global(ul>li>ul>li>ul>li:before)
    opacity 0.6

  :global(li ol), :global(li ul)
    margin 8px 0 8px 35px

  :global(li:has(>input[type=checkbox]))
    &:before
      content none

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

@media (max-width 950px)
  b.m
    :global(ol)
      margin-left 36px

    :global(ul)
      margin-left 26px

    :global(ul li:before)
      margin-left -26px
      top 12px !important

@media (max-width 560px)
  b.m
    :global(ol)
      margin-left 32px

    :global(ul)
      margin-left 20px

    :global(ul li:before)
      margin-left -20px
      top 12px !important
</style>
