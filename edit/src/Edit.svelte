<script lang="coffee">
> @2-/errer
  @2-/tag0
  svelte > tick

< val
< name
< y

+ form, show, bak

Y = =>
  if await errer(
    form
    y bak, val
  ) != null
    show = 0
  return

N = =>
  val = bak
  show = 0
  return

< open = =>
  bak = val
  show = 1
  await tick()
  i = tag0(form,'input')
  if i
    i.focus()
    i.select()
  return
</script>

<template lang="pug">
+if show
  form(@&form @submit|preventDefault=Y)
    slot
    b
      a.I.Y(@click=Y)
      a.I.N(@click=N)
  +else
    b.E {name}
    i
      slot(name="t") {val}
    a.E(@click=open)
</template>

<style lang="stylus">
@import '~/styl/var.styl'

i
  font-style normal
  padding 16px 0

a
  position relative

b.E
  padding 16px
  position relative
  text-align right
  white-space nowrap

form
  display flex
  flex-direction row
  grid-column 1 / span 3
  justify-content space-between

  &>:global(u)
    flex 1
    margin 26px 16px 16px

  &>b
    display flex
    flex-direction column
    height 100%

    &>a
      background var(--svgDv) 0 0 repeat-y
      flex 1
      width 50px

      &:first-child
        background var(--svgDh) 0 100% repeat-x, var(--svgDv) 0 0 repeat-y

      &:before
        transform scale(0.8)

      &:hover
        background-color #f40

a.E
  &:before
    background var(--svgPen) 50% 50% / 18px no-repeat
    content ''
    height 18px
    position absolute
    right 16px
    top 23px
    width 18px

  &:hover
    &:before
      filter btn-hover-filter
</style>
