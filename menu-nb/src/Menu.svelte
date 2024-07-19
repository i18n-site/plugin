<script lang="coffee">
> @8p/wait:Wait
  x/_.js > fJson
  @3-/title_tip

< A

li = A[1].split(',').map(
  (i)=>'/'+i
)

+ I18N

onMount =>
  I18N = (await fJson(A[0]+'/_')).map(
    TitleTip
  )
  return
</script>

<template lang="pug">
+each li as href,p
  a(href:)
    +if I18N
      +if Array.isArray(I18N[p])
        | {I18N[p][0]}
        i {I18N[p][1]}
        +else
          | {I18N[p]}
      +else
        Wait
</template>

<style lang="stylus">
a
  align-items flex-start
  display flex
  flex-direction column

  i
    font-size 12px
    font-style normal

  &>:global(b)
    background-size 32px !important
    height 32px !important
    width 32px !important
</style>

