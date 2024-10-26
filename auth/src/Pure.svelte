<script lang="coffee">
> ./SignUp.svelte
  x/user.js > setUser
  ./reset.js
  @2-/errer:@ > clear
  @2-/focus
  @2-/fp
  @5-/auth > auth
  @8p/box/Focus.js:Box
  @2-/pbox
  @8p/boxmd

< n = 1
< account = localStorage.account or ''

+ form, input_li, autocomplete

N = 'n'

argee = true

ua = boxmd.bind(null,'UA')

:$
  if n
    autocomplete = 'username'
    password = password$
  else
    autocomplete = 'off'
    password = setPassword$

onMount =>
  input_li = [...form.getElementsByTagName 'input'].slice(0,2)
  input_li[0].value = account
  button_li = [...form.getElementsByTagName 'button'].slice(1,3)
  for i from button_li
    i.onclick = (e)->
      clear form
      for i,pos in button_li
        if i == @
          n = pos
          if i.classList.contains N
            e.preventDefault()
            i.classList.remove N
            if n == 0
              for i from input_li
                i.value = ''
        else
          i.classList.add N
        focus form
      return
  button_li[(n+1)%2].classList.add N
  focus form
  return

submit = =>
  if not argee
    return
  li = input_li.map((i)=>i.value)
  user = await errer(
    form
    do =>
      auth(
        await fp()
        n
        ...li
      )
  )
  if user != null
    if user
      localStorage.account = input_li[0].value
      setUser user
    else
      Box SignUp, {
        li
      }
    pbox(form)?.close()
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=submit)
  //- 回车始终是点击它
  button(type="submit")
  +input(">mail")#account(autocomplete: placeholder=" " required type="text")
  +input("{password}")#password(
    autocomplete="current-password"
    minlength="6"
    placeholder=" "
    required
    type="password"
  )
  b(class:d=!argee)
    button(type="submit") >signUp
    button(type="submit") >signIn
  footer
    b
      input#uAuthAgree(checked&argee type="checkbox")
      label(for="uAuthAgree") >agree
      a(@click=ua) >userAgreement
    a(@click={reset.call(this,input_li[0].value)})
      | >resetPassword
</template>

<style lang="stylus">
@import '~/styl/var.styl'

#uAuthAgree
  margin-right 6px

input[type=checkbox]
  border-color #f00

  &+label
    color #f00

input[type=checkbox]:checked
  border-color #999

  &+label
    color #999

input[type=checkbox]
  &:hover
    border-color #f40

    &+label
      color #f40

form
  overflow hidden
  padding-top 10px

  &>button
    left -99em
    position absolute

  & > b
    align-self normal
    margin 0 0 18px

    & > button
      flex 1
      white-space nowrap

    & > :global(button.n)
      background none
      border-bottom 3px solid auth-btn-color
      box-shadow none
      box-sizing border-box
      color auth-btn-color
      flex 0 !important
      padding 16px 0 10px
      padding-bottom 15px
      padding-top 12px
      white-space nowrap

    & > button:first-child
      margin-right 16px

    &.d
      cursor not-allowed
      filter grayscale(1)

      &>button
        pointer-events none

b
  align-items center
  display flex

form
  > p, footer
    align-items center
    box-sizing border-box
    display flex
    justify-content space-between
    padding 16px 0
    width 100%

  footer
    border-top 1px solid #eee
    color #999
    font-size 14px

    a
      color #999

      &:hover
        color #f40

    &>a
      text-align right

    &>b
      &>a
        border-bottom 0.5px solid #ccc
        margin 0 24px -3px 6px
        padding-bottom 3px
        white-space nowrap

      &>a:hover
        border-color #f40
</style>
