<script lang="coffee">
> @2-/errer
  @8p/input_mail_a
  @2-/pbox
  @8p/resend:Resend
  @8p/resend/sendFocus.js
  @2-/fp

< done
< li
< resend
< submit

+ form, sender

send = =>
  sendFocus resend, form
  return

code = ''

s = =>
  r = await errer(
    form
    do =>
      submit(
        await fp()
        ... li
        code
      )
  )
  if r != null
    done(r)
    pbox(form).close()
  else
    sender.$set {state:2}
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=s)
  h1 {_SITE_NAME}
  InputMailA(mail:li[0]) >mail
  b >enterCode
  +input(">code")#code(
    autocomplete="off"
    placeholder=" "
    required
    type="text"
    value&code
  )
  i
    i >checkSpam
    Resend(@&sender send:send)
  slot
</template>

<style lang="stylus">
@import '~/styl/var.styl'
@import '~/styl/util/h1Logo.styl'

i
  font-style normal

form
  padding 0 16px 24px
  user-select none

  :global(button)
    width 100%

  &>b, &>i
    align-self flex-start

  & > b
    margin -8px 16px 12px

  & > i
    align-self stretch
    display flex
    font-size 14px
    font-weight bold
    justify-content space-between
    margin -16px 16px 16px

    &>i
      margin-right 16px
      white-space nowrap
</style>

