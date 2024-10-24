<script lang="coffee">
> @5-/auth > authLi authSet authRm authExitAll
  ./Auth.svelte
  ./Conf.svelte
  ./Menu.svelte
  ./RmMenu.svelte
  ./auth.js > signIn
  ./exit.js
  x/user.js > setUser
  @2-/pbox
  @8p/box/Focus.js
  @8p/box:Box
  @8p/menu
  @8p/wait:Wait

+ li

aRel = (f)=>
  ->
    f.call @, +@parentNode.previousSibling.rel
    return

set = (id)->
  box = pbox @
  first = 1
  for [_id,_,account,e] from li
    if e
      if id == _id
        Focus(Auth,{account})
        box.close()
        return
    else
      if id == _id
        if first
          return
      first = 0

  li = 0
  setUser await authSet id
  box.close()
  return

rmMenu = menu(
  RmMenu
  {
    signIn: aRel set
    rm:aRel (id)=>
      t = li
      li = 0
      setUser await authRm id
      for i,p in t
        if i[0] == id
          t.splice(p,1)
          break
      li = t
      return
  }
)

inMenu = menu(
  Menu
  {
    config:aRel (id)->
      for i from li
        if i[0] == id
          Box(
            Conf
            {
              li: i.slice(0,2)
            }
          )
          pbox(@).close()
      return

    exit:aRel (id)=>
      t = li
      li = 0
      now = await exit id
      for i,p in t
        if id == i[0]
          if i.length == 5
            i.pop()
          i[3] = true
          break
      if now
        for i,p in t
          if i[0] == now[0]
            i.push 1
            break
      li = t
      return
  }
)

drop = ->
  id = +@rel
  for i,p in li
    if i[0] == id
      if i[3]
        m = rmMenu
      else
        m = inMenu
      m.call @
      break
  return

exitAll = ->
  box = pbox @
  li = 0
  await authExitAll()
  setUser false
  box.close()
  return

add = ->
  Focus(Auth, {account:''})
  pbox(@).close()
  return

onMount =>
  t = await authLi()
  if not t
    setUser false
    signIn()
    return
  inli =[]
  outli = []
  for i from t
    if i[3]
      t = outli
    else
      t = inli
    t.push i
  if inli.length
    inli.reverse()
    inli[0].push 1
  li = inli.concat outli
  return
</script>

<template lang="pug">
+if li
  +each li as [id,name,account,e,n]
    u(class:e=e)
      i(@click={set.call(this,id)} class:n=n)
        b
          | {name}
          b {account}
      a(@click=drop rel:id)
  i
    a(@click=add) >addAccount
    a(@click=exitAll) >exitAll
  +else
    Wait
</template>

<style lang="stylus">
@import '~/styl/var.styl'

u
  text-decoration none

u, i
  display flex
  justify-content space-between
  user-select none

i
  background var(--svgDh) 5px 0 repeat-x
  font-style normal
  padding 16px

  &:first-child
    border 0

  &>a
    color #000
    font-size 15px

    &:hover
      color #f40

  &>b
    display flex
    flex-direction column

    &>b
      font-size 14px

u
  margin 0
  position relative

  :global(b.menu)
    right -2px

  &>i, &>a
    position relative

  &>i:after, &>a:before, &>a:after
    content ''
    position absolute

  &>i
    cursor pointer
    flex 1

    &>b>b
      color #999

    &:hover
      &>b
        color #f40

      &>b>b
        color #f40

    &.n
      cursor auto

      &>b, &>b>b
        color #000

    &:after
      right 22px
      top 50%

    &:hover:after
      border 1px solid #f40
      border-radius 13px
      color #f40
      content '→'
      font-weight 100
      height 27px
      line-height 25px
      margin-top -12px
      padding 0 7px

    &.n:after
      background #3d0
      border 0
      border-radius 4px
      box-shadow 0 0 3px inset
      color #090
      content ''
      height 8px
      margin-top -4px
      padding 0
      width 8px

  &>a
    background var(--svgDh) 0 100% repeat-x
    border 1px solid transparent
    border-right 0
    margin-bottom -2px
    width 50px

    &:before, &:after
      bottom 0
      left 0
      right 0
      top 0

    &:before
      background var(--svgDv) 0 0 repeat-y

    &:after
      background var(--svgNabla) 50% 50% / 12px no-repeat
      margin-bottom -6px
      margin-right -6px

    &:hover
      background #f5f5f5
      border-color #ddd

      &:before
        background 0

      &:after
        filter btn-hover-filter

  &.e
    &>i
      color #999

    &>a
      opacity 0.5

    &:hover
      &>a
        opacity 1
</style>
