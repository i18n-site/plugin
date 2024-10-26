<script lang="coffee">
> @5-/auth > authSetMail authNewMail
  @2-/errer
  @8p/box/done.js:boxDone
  @8p/input_mail_a
  @8p/resend:Resend
  @8p/resend/sendFocus.js
  @2-/pbox

# NowMail uid NewMail
< li

+ form, new_code, old_code, sender

send = =>
  sendFocus(
    =>
      li[0] = await authNewMail(
        ...li.slice(1)
      )
      return
    form
  )
  return

submit = =>
  if await errer(
    form
    authSetMail(...li.slice(1), old_code, new_code)
  ) != null
    boxDone()
    pbox(form).close()
  else
    sender.$set {state:2}
  return
</script>

<template lang="pug">
include /input.pug
form(@&form @submit|preventDefault=submit)
  h5
    p >enterCode
    b >checkSpam
  +if li[0]
    InputMailA(mail:li[0]) >nowMail
    +input(">nowMail >code")#now(
      placeholder=" "
      required
      type="text"
      value&old_code
    )
  InputMailA(mail:li[2]) >newMail
  +input(">newMail >code")#mail(
    placeholder=" "
    required
    type="text"
    value&new_code
  )
  Resend(@&sender send:send)
  button(type="submit") >config
</template>

<style lang="stylus">
button
  width 100%

h5
  display flex
  flex-direction column
  margin 16px

  &>b
    font-variation-settings 'wght' 999, 'BEVL' 30

  &>p
    margin 0

form
  & > :global(u)
    margin 0 16px 24px

  & > :global(b)
    font-size 14px
    margin -6px auto 24px
</style>

