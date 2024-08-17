<style lang="stylus">
i
  font-style normal

h4
  display flex
  justify-content space-between

  &>i
    &>i
      margin-left 6px

  select
    appearance none
    background var(--svgNabla) 100% 38% no-repeat
    border 0
    border-bottom 1px solid #000
    font-family h
    font-size 24px
    font-variation-settings 'wght' 250, 'BEVL' 40
    margin 0 24px -4px 0
    outline none
    padding-bottom 12px
    padding-right 16px
    user-select none

u
  border-bottom 1px dashed #000
  display flex
  justify-content space-between
  padding 16px 0
  text-decoration none

b
  border-bottom 1px solid #000
  display block

  &>table
    border-collapse collapse
    width 100%

    &>tr>th, &>tr>td
      font-weight 300
      padding 16px 0 16px 16px
      text-align left

      &:first-child
        padding-left 0

      &:last-child
        text-align right

    &>tr
      &>td
        border-bottom 1px dashed #ccc

      &:last-child
        &>td
          border 0

    &>tr>th
      border-bottom 1px solid #000
      border-width 1px 0 1px 0
</style>


<script lang="coffee">
> @5-/pay > pay payBill
  @3-/time/nMonth.js
  @3-/time/dayMD.js
  ~/lib/I18N.js > _$translate _$bonus _$manual _$topup _$cardFee
  ./HelpMail.svelte
  ./Main.svelte
  ./Menu.svelte
  ./TopUp.svelte

+ cash, li, month_li, CID, sum, ing

onI18n ->
  t = [
    (kid)=> # 充值
      [
        @[_$topup]
        # if kid == 1 then '' else @[[_$manual][kid]]
        # TODO
        @[[_$manual,_$bonus][kid]] or ''
      ]
    (kid, rid)=> # API
      [
        @[_$translate]
        ''# rid
      ]
    (kid, rid) => # fee
      [
        @[_$cardFee]
        ''# rid
      ]
  ]

  CID = t
  return

sign = (n)=>
  n = n/100
  if n > 0
    n = '+'+n
  n

liRender = (_li)=>
  _li.sort (a, b) ->
   return b[2] - a[2]

  _sum = 0

  + pday

  t = []

  for [cid,kid,rid,day,n] from _li
    _sum += n
    if pday == day
      day = ''
    else
      pday = day
      day = dayMD day
    nli = CID[cid] kid,rid
    t.push [
      day
      ...nli
      sign n
    ]
  li = t
  sum = sign _sum
  return


onMount =>
  [
    cash
    _li # cid rid day n
    month_li
    ing
  ] = await pay()
  cash /= 100
  liRender _li
  return

change = ->
  liRender await payBill +@value
  return
</script>

<template lang="pug">
Main
  +if li
    +if li.length
      Menu
        i
          a.n >bill
        a(href="/pay") >topup

      +if ing.length
        u
          | {ing.length}
          | >topupOnWay
          i
            +each ing as i
              i {(i[1]/100).toFixed(2)} USD
      h4
        +if month_li.length
          select(@change=change)
            +each month_li as m
              option(value:m) {nMonth(m)}
        i >asset
          i {cash}
      b
        table
          +if li.length > 1
            tr
              th(colspan=3)
                | >amountInTotal
              th {sum}
          +each li as i
            tr
              +each i as j
                td {j}
      HelpMail
      +else
        TopUp(h:>needTopup)
</template>
