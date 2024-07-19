<script lang="coffee">
> @8p/wait:Wait
  x/On.js
  x/utf8d.js
  @stripe/stripe-js/pure > loadStripe
  x/lang.js > onSet:onLangSet
  ~/lib/S.js
  @5-/pay > payBind
  ./AutoTopUp.svelte

+ el, type, form, pay, I, stripe, unmount

< h = 0

err = 0

isPay = (s)=>
  s.endsWith '_pay'

errRender = (r)=>
  {error} = r
  if error
    err = error.message
    return
  return 1

onMount =>
  unmount

{pathname} = location

< A = 0

onLangSet (locale)=>
  if el
    el.update {locale}
    return

  [email,pk] = A or await payBind()

  stripe = await loadStripe(pk)

  el = stripe.elements {
    locale
    currency: 'usd'
    mode:'setup'
    loader: 'never'
    # setupFutureUsage: 'off_session'
    appearance:
      labels: 'floating'
      rules:
        '.Label--floating':
          paddingBottom: '12px'
      variables:
        spacingUnit: '4px'
        colorBackground: '#fff'
        colorPrimary: '#333'
        borderRadius: 0
  }

  opt = {
    layout:
      type: 'accordion'
      visibleAccordionItemsCount:0
      radios: false
  }

  if email
    opt.defaultValues = {
      billingDetails: {
        email
      }
    }

  pay = el.create(
    'payment'
    opt
  ).on(
    'change'
    (e)=>
      if errRender e
        { type } = e.value
        if isPay type
          submit()
      return
  )

  unmount = =>
    observer.disconnect()
    return

  observer = new ResizeObserver =>
    if I.clientHeight > 4
      err = unmount()
    return

  observer.observe(I)
  pay.mount(I)
  return

ING = 'ing'

submit = =>
  form.classList.add ING

  {href} = location

  try
    if errRender await el.submit()
      errRender await stripe.confirmSetup({
        elements: el
        clientSecret: 'seti_'+utf8d await S.paySetup()
        confirmParams: {
          return_url: 'https://'+location.host+'/pay'
        }
      })
    else if isPay type
      pay.collapse()
      return
  finally
    form.classList.remove ING

  return

</script>

<template lang="pug">
form(@submit|preventDefault=submit @&form)
  +if err==0
    Wait
    +else
      +if h
        h2 { h }
  i(@&I)
  +if err!=0
    +if err
      b.err { err }
    AutoTopUp
    button(type="submit") >addCard
</template>

<style lang="stylus">
button
  width 100%

form
  max-width 500px
  min-width 318px

  & > i
    overflow hidden
    padding-bottom 2px
    // 避免弹出框的横向滚动条
    width 100%

  & > b.err
    border 2px solid #f00
    border-radius 16px
    color #f00
    font-size 16px
    font-weight 500
    margin-top 16px
    padding 3px 12px

h1
  display flex
  justify-content center

form>:global(b.w)
  margin 64px auto
</style>

