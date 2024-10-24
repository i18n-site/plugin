<script lang="coffee">
> ./Bind.svelte
  ./BindBox.svelte
  @2-/tag0
  @8p/wait:Wait
  @3-/time/nYm.js
  @8p/drop:Drop
  @8p/box:Box
  x/route.js > goto
  x/forceGoto.js
  @2-/new:New
  @2-/ing:Ing
  @2-/errer
  @5-/pay > payLi payRm paySetDefault payTopup
  ~/lib/S.js
  ./AutoTopUp.svelte
  ./DropCard.svelte
  ./HelpMail.svelte

+ card_li, stripe_li, card, rate, max, form, ed, STATUS

# 标题
< h = 0

n = 10 # 默认充值金额

conv = (x)=>
  Math.ceil(x*100)

:$
  fee = Math.ceil(conv(n*.049 + .3))/100
  payN = (conv(n)/100 + fee).toFixed(2)
  fee = fee.toFixed(2)

onMount =>
  {search, pathname} = location

  [
    card_li,brand_li,stripe_li,rate
  ] = await payLi(+!search)

  rate /= 1e6

  max = Math.floor 1e4/rate

  if not stripe_li[1]
    stripe_li = 0
    card = card_li[0][0]
    brand_map = new Map brand_li
    card_li.forEach (i)=>
      i[1] = brand_map.get i[1]
      if i[2]
        i[2] = nYm i[2]
      return
    card_li = card_li

  if search # 这样用户请求不成功 , 还可以刷新重试
    goto pathname

  if card_li.length
    setTimeout =>
      tag0(form,'input').focus()
      return
  return

drop = [
  DropCard
  {
    setDefault: (el,id)=>
      await Ing(
        el
        paySetDefault id
      )
      for i,p in card_li
        if i[0] == id
          card_li.splice p,1
          card_li.unshift i
          card_li = card_li
      card = id
      return

    rm: (el,id)=>
      await Ing(
        el
        payRm id
      )
      for i,p in card_li
        if i[0] == id
          card_li.splice p,1
          if card_li.length
            card = (card_li[p] or card_li[p-1])[0]
          card_li = card_li
          return
      return
  }
]

add = =>
  [box] = Box BindBox
  style = New.style
  style.innerHTML = 'dialog>b>form>p{padding:16px!important;box-sizing:border-box}.__PrivateStripeElement{width:calc(100% + 4px);}dialog>b>form>b.err{margin:16px 16px 0;}'
  box.appendChild(style)
  return

submit = =>
  if ed
    if ed == 1
      ed = 0
    else
      forceGoto 'payBill'
    return

  ed = await errer(
    form
    payTopup conv(payN), card
  )
  if ed
    if [1,6].includes ed[2]
      rate = ed[1]/1e6
    else
      ed = 1
  return

  # STATUS = [
  #   'Canceled'
  #   'Processing'
  #   'RequiresAction'
  #   'RequiresCapture'
  #   'RequiresConfirmation'
  #   'RequiresPaymentMethod
  #   '充值成功'
  # ]
</script>

<template lang="pug">
+if card_li
  +if card_li.length
    form(@&form @submit|preventDefault=submit class:d=ed)
      +if ed == 1
        p.s >topUpFailed
        button >rtRetry
        +else
          +if ed
            p
              i
                | >topup
                |
                | { Math.floor(ed[0] / 100 - fee).toFixed(2) }
                | >USD
            +else
              +if h
                h2 { h }
              u
                label(for="n") >topupAmount
                input#n(
                  &n
                  placeholder:>amount
                  autocomplete="off"
                  max:max
                  min="10"
                  step="0.01"
                  type="number"
                )
                label(for="topUpV") >USD
          p
            i
              | >cardFee
              | (
              | 4.9% + 0.3
              | )
            b {fee}
          //-
            p
              i
                | >USD
                |
                | →
                |
                | >EUR
              a(
                href="//www.mastercard.us/en-us/personal/get-support/convert-currency.html"
              )
                | >exchangeRate
                |
                | { rate.toFixed(6) }
          +if ed
            //-
              p
                i >pay
                  | { (ed[0] / 100).toFixed(2) }
                  | >EUR
            p.s
              +if ed[2] == 6
                | >topupOk
                +else
                  b >topupApplyed
                  b >waitTopupRecv
                  b >whenTopupRecv
                  b >willMailNotify

            button >ok
            +else
              button
                | >pay
                | { payN }
                | >USD
              AutoTopUp
              +each card_li as i
                i
                  input(id="{ 'card' + i[0] }"
                    name="i"
                    type="radio"
                    value:i[0]
                    group&card
                  )
                  label(for="{ 'card' + i[0] }")
                    b { i[1] } { i[4] }
                    +if i[2]
                      i
                        i >expire
                        b { i[2][0] }
                        b { (i[2][1] + '').padStart(2, '0') }
                    +if i[3] != 5
                      b { i[3] }
                  Drop(A:drop)
              i
                a(@click=add) >addNewCard
      HelpMail
    +else
      Bind(A:stripe_li h:h)
      HelpMail
  +else
    b
      Wait
</template>

<style lang="stylus">
i
  font-style normal
  white-space normal

form
  &.d
    &>p
      border-bottom 1px dashed #ccc

      &.s
        align-items center
        border-bottom 0
        flex-direction column

  &>input
    box-sizing border-box
    width 100%

  &>u, &>p
    display flex
    justify-content space-between
    width 100%

  &>p
    margin 0
    padding 16px 0

    &>i
      margin-right 20px

  &>u
    flex-wrap wrap
    margin 0

    &>:global(b)
      flex 1 1 auto
      width 100%

    &>label, &>input
      border 1px solid #000
      border-width 1px 0

    &>label
      align-items center
      display flex
      padding 0 18px
      user-select none

      &:first-child
        border-left 1px solid #000

    &>input
      border-right 0
      flex 1
      padding 16px 0
      text-align center
      width 64px

      & + label
        border-right 1px solid #000

    :global(&.E > label), :global(&.E >input)
      border-color #f00 !important

  &>i
    border-top 1px dashed #999
    display flex
    position relative
    width 100%

    &>label
      line-height 64px

      &>b
        margin 0 16px 0 23px
        text-transform uppercase

      &>i
        color #999
        font-size 12px
        margin-top 2px

        &>i
          margin-right 6px

        &>b:last-child
          &:before
            border-left 1px solid #999
            content ''
            display inline-block
            height 6px
            margin 0 6px
            transform rotate(20deg)
            vertical-align 1px

  &>button
    width 100%

form>i>:global(b.menu)
  margin-top -18px

form>i>:global(a)
  background-position-x 51%
  margin-left 12px
  margin-top 25px
  padding 0 0 0 2px

form>i>a
  align-self flex-end
  border-bottom 1px solid #03a
  cursor pointer
  display flex
  margin 0
  padding-bottom 6px
  padding-top 18px

  &:hover
    border-color #f40
    color #f40

b>:global(b.w)
  margin 64px auto
</style>
