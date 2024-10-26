<script lang="coffee">
> @8p/wait:Wait
  @8p/auth/auth.js > signIn
  @8p/auth/Pure.svelte
  @5-/github > github # githubNew

+ state,args
# ,mail

tid = location.search.slice(1)

# submit = =>
#   state = undefined
#   await githubNew(
#     tid
#     mail
#   )
#   return

onMount =>
  args = await github tid
  state = args.shift()
  # Done = 0
  # GithubUserUsed = 1
  # UserUsed = 2
  # NeedAuth = 3
  args[0] = args[0]/100
  # console.log new Date, {state}, args
  # if state == 3
  #   mail = args[1][0][0]
  return
</script>

<template lang="pug">
main
  +if state == 0
    h2 >bonusDone
    h2 >userAsset ${args[0]}
    h2
      a(href="/") >backHome
    +elif state == 1
      h2 >githubBonusUsed
      h2
        a(href:args[1]) >bindOtherGithub
    +elif state == 2
      h2 >bonusUsed
      h2 >bonusOnce
      h2 >userAsset ${args[0]}
      h2
        a(href="/") >backHome
    +elif state == 3
      h2
        | >bonus
        p >signInFirst
      //-
        +if args[2].length
          form(@submit|preventDefault=submit)
            +each args[2] as [id,m],n
              p
                input(id:'mail'+id type="radio" value:id name="mail" group&mail)
                label(for:'mail'+id)
                  b {m}
            button(type="submit") 用此邮箱登录
          h2
            a(@click=signIn) 登录其他账号
          +else
            Pure
      Pure
    +else
      Wait
</template>

<style lang="stylus">
main
  align-self center
  display flex
  flex 1
  flex-direction column
  justify-content center
  margin 24px
  max-width 600px

form
  background var(--svgDh) 0 0 repeat-x, var(--svgDh) 0 100% repeat-x
  display flex
  padding 12px 0 24px

  button
    display flex
    justify-content center
    width 100%

h2
  align-items center
  display flex
  flex-direction column
  font-size 18px
  margin-bottom 12px

  p
    color #999
    font-size 16px
    margin 0

  a
    border-bottom 2px solid #03a

    &:hover
      border-color #00f
      border-width 3px

label
  &>b
    margin-left 24px
</style>

