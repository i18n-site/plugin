<script lang="coffee">
> @8p/md/MdTxt.svelte
  @8p/toclib/tocFlat.js
  @8p/base-toc/BaseToc.svelte
  @3-/tinyml
  @3-/mark
  @3-/fli
  svelte > tick
  x/On.js
  x/_.js > fJson fMd
  x/isPrefix.js

+ M, md, B, LI, TITLE, PRE_TITLE, INDEX, scroll, unbindScroll

onMount =>
  PRE_TITLE = document.title
  =>
    document.title = PRE_TITLE
    return

A = [
  # set
  (_md)=>
    if _md == 0 and location.pathname.slice(1) == B
      md = 1
      document.title = TITLE

      pos = INDEX?.length or 0
      iter = fli(
        LI
        (t)=>
          fMd t[1].slice(1)
        pos
      )

      if not scroll
        await tick()
        scroll = M.closest('.scroll')

      needLoad = =>
        (scroll.scrollHeight - scroll.scrollTop) < 2*scroll.getBoundingClientRect().height

      load = =>
        unbindScroll?()
        loop
          {done,value} = await iter.next()
          if done
            return
          t = LI[pos++]
          tli= (value[0] or '').split("\n")
          line_break = '---'
          if tli[0] == line_break
            tli.shift()
            for i,p in tli
              if i == line_break
                meta = tli.slice(0, p)
                break
            if meta
              {brief} = tinyml meta.join('\n')
              if brief
                t.push mark brief
          if INDEX
            INDEX = INDEX.concat [t]
          else
            INDEX = [t]

          if not needLoad()
            unbindScroll = On(
              scroll
              scroll:=>
                if needLoad()
                  load()
                return
            )
            break
        return
        # INDEX[0].push('林浩克','Apache Kvrocks 创始人','https://www.baidu.com/')
        # INDEX[1].push('林浩克','Apache Kvrocks 创始人')
      load()
      return

    unbindScroll?()
    md = _md
    await tick()
    return M
  # init
  (ali, pathname)=>
    if B == pathname
      return
    for i from ali
      p = i.pathname.slice(1)
      if isPrefix pathname,p
        return [p,i]
    return
  # fToc
  (prefix)=>
    LI = []
    [author_li, B, ...toc] = await fJson prefix+'/_'
    [TITLE] = toc
    tocFlat(
      toc
      (li)=>
        if li.length > 2
          author = li[3]
          if ~author
            li[3] = author_li[author]
          else
            delete li[3]
          LI.push li
        return
    )
    LI.sort(
      (a,b) =>
        a = a[2]
        b = b[2]
        # 负数排在前面，正数排在后面，同时负数从大到小，正数从大到小
        return Math.sign(a) - Math.sign(b) || b - a
    )
    [B, ...toc]
]
</script>

<template lang="pug">
mixin user
  | {author[0]}
  +if author[1]
    b /
    | {author[1]}

BaseToc(A:)
  +if md != undefined
    +if md === 1
      main(@&M)
        +if INDEX
          +if INDEX.length
            +each INDEX as [title, href, ts, author, brief]
              b
                h2
                  a(href:) {title}
                div
                  +if brief
                    | {@html brief}
                footer
                  i
                    a(href:) ⇨
                      |
                      | >readMore
                    +if author
                      +if author[2]
                        a(href:author[2])
                          +user
                        +else
                          b
                            +user
                  +if ts > 0
                    b
                      a(href:) {new Date(ts*1e3).toISOString().slice(0,10)}
            +else
              h1 >noContent
          +if INDEX?.length != LI.length
            progress

          +else
            progress
      +else
        MdTxt(bind:R=M md:md)
    +else
      progress
</template>

<style lang="stylus">
@import '~/styl/var.styl'
@import '~/styl/util/pbar.styl'

main
  &>progress
    margin 128px 0

  &, &>b
    display flex
    flex-direction column

  a
    display inline-block

  &>b
    &>div
      :global(p)
        margin 0 0 6px

    &>footer
      background var(--svgDh) 0 50% repeat-x
      display flex
      justify-content space-between
      margin-top 16px

      &>i, &>b
        background #fff

      &>i
        font-style normal
        padding-right 16px

        &>a, &>b
          color #666
          font-size 16px
          margin-left 16px

          &>:global(b)
            font-size 10px
            margin 0 8px
            vertical-align 2px

        &>a
          background var(--svgDh) 0 100% repeat-x
          padding-bottom 4px
          vertical-align 3px

        &>a:first-child
          background none
          border 1px solid #ccc
          border-radius 16px
          box-shadow 0 0 2px inset #999
          font-size 16px
          margin-left 0
          padding 2px 16px
          vertical-align 0

      &>b
        padding-left 16px

        &>a
          color #999
          font-size 16px

    &>h2
      font-size 24px
      font-variation-settings 'wght' 500, 'BEVL' 90
      margin 22px 0 10px

      a
        color #000

  a:hover
    filter btn-hover-filter
</style>

