<script lang="coffee">
> @2-/watch
  @2-/qy
  @3-/debounce
  ./qMd.js:@ > fMd

< v

+ input, more

LI = undefined

PMAX = 1
PVAL = 0

nohide = (pos)=>
  li = LI[pos]
  LI[pos][2] = li[2].concat li.pop()
  return

x = (e)->
  t = e.target
  while t != @
    if t.tagName == 'A' and t.href
      @parentNode.parentNode.close()
      return
    t = t.parentNode
  return

onMount =>
  input.value  = v = v.trimStart()
  {length} = v
  setTimeout =>
    # safari 下让光标在最后
    input.setSelectionRange length, length
    input.focus()
    return
  v = v.trimEnd()

  find = =>

  do =>
    url_ver_li = await qMd()
    PMAX = url_ver_li.length
    limit = 9
    [search, close] = await qy(
      document.documentElement.lang
      url_ver_li
      fMd
      =>
        ++PVAL
        return
      limit
    )

    find = =>
      v = input.value.trim()
      iter = search(v)
      LI = (await iter.next()).value or []
      if LI.length >= limit
        more = _more = =>
          more = 1
          next = await iter.next()
          {value, done} = next
          if value
            LI = LI.concat value
          if done or value.length < limit
            more = false
          else
            more = _more
          return
      else
        more = 0
      return

    find()
    return


  delayFind = debounce 400,=>
    LI = undefined
    find()
    return

  unmount = watch input, (val)=>
    val = val.trim()
    if v == val
      return
    if not LI?.length
      LI = undefined
    v = val
    delayFind()
    return

  =>
    close()
    unmount()
    return
</script>

<template lang="pug">
input(@&input placeholder:>qHolder)
main
  +if v
    //- +each LI as i
    //-   p {i}
    +if PMAX != PVAL
      progress(max:PMAX value:PVAL)
      +elif LI
        +if LI.length
          i(@click=x)
            +each LI as [url, title, show, hide], pos
              b
                h1
                  a(href:url) {@html title}

                +if show.length
                  +each show as [[url, section], ...lines]
                    +if section
                      h2
                        a(href:url) {@html section}
                    p
                      +each lines as line
                        a(href:url) {@html line}

                  +if hide?.length
                    p.M
                      a(@click={nohide(pos)})
                        | >more
                        | …
            +if more
              footer
                +if more === 1
                  progress
                  +else
                    a(@click=more) >loadMore
          +else
            b >noSearchResult
        +else
          progress
    //-   +if bMAX
    //-     progress(max:bMAX value:bVAL)
    //-     +else
    //-       progress
    //-   +else if not LI.length
    //-     b 查无结果
    +else
      div
        h1 >searchTip
        p
          | >doubleClick
          code ESC
          | >closeSearch
</template>

<style lang="stylus">
@import '~/styl/util/pbar.styl'

@keyframes fadeIn
  from
    opacity 0

  to
    opacity 1

input
  border 0
  border-bottom 1px solid #eee
  box-shadow 0 0 3px inset #eee
  box-sizing border-box

input, main
  width 720px

h1, h2
  display flex
  font-size 16px
  margin 0

p
  margin 0

:global(b.h)
  background #ff0
  color #e30

:global(progress)
  animation-duration 2s
  animation-fill-mode forwards
  animation-name fadeIn

main
  display flex
  flex-direction column
  height calc(100dvh - 156px)
  justify-content center
  overflow auto

  &>i>b
    border-bottom 1px solid #eee
    padding 8px

  &>i, &>i>b>:global(p)
    display flex
    flex-direction column

  &>i p.M
    display block

    &>a
      background var(--svgHline) 0 100% / 512px repeat-x
      display inline-block
      font-size 14px
      margin-bottom 8px
      padding-bottom 2px
      white-space nowrap

      &:hover
        filter invert(42%) sepia(1) saturate(47)

  &>i
    font-style normal
    height 100%

    a
      color #333
      cursor pointer
      font-size 16px
      margin 0 18px

      &:hover
        color #00f

  &>b
    align-self center
    color #999
    display flex
    font-family h
    font-size 24px
    font-variation-settings 'wght' 500, 'BEVL' 10

  &>div
    align-self center
    padding 1rem

    code
      background #fafafa
      border 1px solid #ccc
      border-radius 3px 3px 7px 7px
      border-top 2px solid #ddd
      box-shadow 0 0 3px #ccc inset
      font-size 14px
      font-weight bold
      margin 0 6px
      vertical-align 2px

    &>h1
      font-size 20px
      margin 0

  h2
    margin 6px 0

    a
      border 1px solid #999
      border-radius 8px
      box-shadow 0 0 3px inset #999
      color #666
      display inline-block
      font-size 12px
      padding 5px 8px 4px

      &:hover
        border-color #00f
        box-shadow 0 0 3px inset #009

footer
  display flex
  justify-content center
  padding 16px 0

  a
    border 1px solid #000
    border-radius 16px
    box-shadow 0 0 2px inset
    color #000
    padding 1px 13px
    user-select none

    &:hover
      filter invert(42%) sepia(1) saturate(47)

@media (max-width 750px)
  input, main
    width 100%
</style>

