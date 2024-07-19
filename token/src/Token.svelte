<script lang="coffee">
> ./Menu.svelte
  ./New.svelte
  @2-/copy
  @2-/tag0
  @5-/token > token tokenRm tokenRefresh tokenNew tokenTurn
  @8p/box/Focus.js:Box
  @8p/wait:Wait
  @8p/drop:Drop

+ li

create = =>
  Box(
    New
    {
      add:(name)=>
        li = [await tokenNew(name)].concat li
        return
    }
  )
  return

drop = [
  Menu
  {
  refresh: (id)=>
    r = await tokenRefresh(id)
    if r
      for i,p in li
        if i[0] == id
          li[p][2] = r
          break
    return
  rm:(id)=>
    for i,p in li
      if i[0] == id
        li.splice(p,1)
        break
    await tokenRm(id)
    li = if li.length then li else await token()
    return
  turn:(id,v)=>
    for i,p in li
      if i[0] == id
        i[3] = v
        li[p] = i
        break
    await tokenTurn(id,v)
    return
  }
]


onMount =>
  li = await token()
  return

cp = ->
  d = 'd'
  @classList.add d
  setTimeout(
    =>
      @classList.remove d
    2e3
  )
  copy(
    'token: '+tag0(@parentNode,'i').innerText
  )
  return
</script>

<template lang="pug">
main
  h1 >apiToken
  +if li
    b
      +each li as [id,name,t,enable]
        b(class:e=enable)
          b
            b
              +if name
                | { name }
                +else
                  | >defaultToken
            Drop(A:drop rel:id)
          i
            i { t }
            a(@click=cp)
    button(@click=create) >create
    +else
      Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

main
  align-self center
  display flex
  flex 1
  flex-direction column
  justify-content center
  margin 24px
  max-width 600px

  b
    display flex
    flex-direction column

  &>b
    margin-bottom 16px

    &>b
      margin-bottom 16px

      &:not(.e)
        &>i, &>b>b
          opacity 0.3

      &>i
        border 1px solid #000
        display flex
        justify-content space-between

        &>a
          background var(--svgCopy) 50% 50% / 24px no-repeat
          position relative
          transition none
          width 50px

          &:hover
            filter btn-hover-filter

          &:global(.d)
            background none

            &:hover
              filter none

            &:before
              background #390
              clip-path polygon(0 51%, 38% 73%, 100% 0, 100% 35%, 44% 100%, 0 74%)
              content ''
              display block
              height 20px
              left 50%
              margin-left -8px
              margin-top 30%
              position relative
              width 16px

        &>i
          border-right 0
          font-family c, monospace
          font-size 12px
          font-style normal
          padding 16px

      &>b
        align-items center
        flex-direction row
        justify-content space-between
        margin-bottom 16px
        position relative

  &>h1
    text-align center
    width 100%

  button
    width 100%
</style>
