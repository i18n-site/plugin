<script lang="coffee">
> ./T.svelte
  @2-/new:New
  @3-/title_tip
  @8p/shash
  @8p/smnt:Mount
  @8p/toclib/T.svelte:St
  @8p/toclib/scrollSync.js
  @8p/toclib/toc.js:tocSM
  @8p/toclib/tocFlat.js
  svelte > tick
  x/_.js > fMd
  x/selfA.js
  x/route.js > setUrl
  x/isPrefix.js

N = 'N'
W = 'W'
S = 'S'
NW = [N,W]

# set toc ver
< A

[set, [prefix,...toc], ver, doRender] = A


tocFlat(
  toc
  (li)=>
    slash = '/'
    if Array.isArray(li)
      t = li[1]
      # 避免侧栏反复开关导致url改变
      if t.startsWith slash
        return
      li[1] = slash+prefix
      if t
        li[1] += slash + t
    return
)

+ title, M, tip, h1a, ver, pre_b, unmount

urlA = (pathname)=>
  ali = M.getElementsByTagName('a')
  if not h1a
    ali = [...ali]
    ali.shift()
  if not h1a and pathname != prefix
    for i from ali
      if i.pathname.slice(1) == pathname
        return [pathname,i]
  if doRender(pathname)
    for i from ali
      p = i.pathname.slice(1)
      if isPrefix pathname,p
        return [p,i]
  return

onMount =>
  title = toc[0]
  if Array.isArray(title)
    [title, h1a] = title

  title_tip = TitleTip title
  if Array.isArray title_tip
    [title, tip] = title_tip

  await tick()

  url = location.pathname.slice(1)
  pi = urlA url
  if pi
    # 比如 重定向到了第一章
    if pi[0] != url
      setUrl pi[0]
    shash await setNow ...pi
  else
    set 0
  =>
    unmount?()
    return


pager = (dom)=>
  ali = []

  tocFlat toc, (i)=>
    ali.push(i)
    return

  li = []
  addA = (p, offset, arrow, wrap)=>
    t = ali[p+offset]
    if t
      [txt, href] = t
      {a,b} = New
      a.href = href
      a.className = 'a'+offset
      b.innerText = txt
      a.appendChild b
      {b} = New
      b.innerText = arrow
      wrap a, b
      li.push a
    return
  {pathname} = location
  for [txt,path], p in ali
    if path == pathname
      addA p, -1,'⇦',(a,b)=>
        a.insertBefore b,a.firstChild
        return
      addA p, 1, '⇨', (a,b)=>
        a.appendChild b
        return

  if li.length
    {div, b} = New
    div.className = "P"
    for i from li
      b.appendChild i
    div.appendChild(b)
    dom.appendChild(div)
  return


setNow = (url, e)=>
  # for show wait
  set undefined

  need_mount = e.parentNode.tagName != 'I'

  for i from NW
    e.classList.add i

  if unmount
    unmount()
    unmount = undefined
  pre_b?.remove()
  if need_mount
    {b} = New
    e.after(b)
    pre_b = b

  md = await fMd(url).finally =>
    e.classList.remove W
    return

  [scroll, main] = sm = await set md

  if pre_b == b # 防上面 await 期间点了其他章节
    if main
      pager main

      if need_mount
        args = tocSM ...sm
        if args
          Mount(
            St
            b
            {
              A:args[0][0][1]
            }
          )
          # 同步导航栏滚动
          unmount = scrollSync(
            M
            [
              e
              ...b.getElementsByTagName('a')
            ]
            ...args
          )
          return scroll
    # 点击项目名的链接时, pre_b 是未定义的
    pre_b?.remove()
  return scroll


a = (e)=>
  pathname = location.pathname.slice(1)
  p = e.target
  while p
    if p.nodeName == 'A'
      if p.href
        url = selfA(p,e)
        if url
          e.stopPropagation()
          {hash} = p
          if hash
            url = url.slice(0,-hash.length)
          if url != pathname
            M.querySelectorAll('a.'+N).forEach (i)=>
              for c from [S, ...NW]
                i.classList.remove c
              return

            # 如果 没有标题链接 并且 当前请求为 根目录 跳转第一章


            ali_has_url = 1
            if not h1a and prefix == url
              r = urlA(url)
              if r
                [url, p] = r
              else
                ali_has_url = 0

            setUrl url

            if ali_has_url
              setNow url, p
            else
              set 0
          else if hash
            if location.hash == hash
              location.hash = ''
            A = 'A'
            M.querySelectorAll('a.'+A).forEach (i)=>
              i.classList.remove A
              return
            p.classList.add A
            location.hash = hash
          else
            p.classList.toggle 'S'
      break
    p = p.parentNode
  return
</script>

<template lang="pug">
main(@&M @click=a)
  h1
    i
      a(href="{ h1a || '/' + prefix }") { title }
      +if tip
        i { tip }
    +if ver
      i { ver }
  b
    T(A:{toc.slice(1)})
//-  h1
//-    b i18n.site
//-      i 多语言纯静态建站工具
</template>

<style lang="stylus">
@import '~/styl/var.styl'

main
  display flex
  flex-direction column
  width 100%

  &>b
    margin 8px 24px

i
  font-style normal

h1
  background linear-gradient(0, #f3f3f3, #fcfcfc 50%, #fff)
  color #666
  display flex
  font-size 16px
  justify-content space-between
  margin 0
  padding 16px 24px
  position relative

  &>i+i
    background rgba(255, 255, 255, 0.1)
    border-radius 6px
    box-shadow #666 0 0 3px inset
    color #999
    font-family c
    font-size 12px
    padding 1px 6px

  &>i:first-child
    &>a
      color #666
      display inline-block
      margin-bottom 7px
      padding-bottom 0
      position relative
      transition all 0.3s

      &:after
        background var(--svgHline) 0 0 / 500px repeat-x
        bottom -2px
        content ''
        height 1px
        left 0
        opacity 0.8
        position absolute
        width 100%

      &:hover
        filter btn-hover-filter

    &>i
      display block
      font-size 12px

/*
  &:after
    background var(--svgNabla) 50% 50% / cover no-repeat
    content ''
    height 8px
    opacity 0.5
    position absolute
    right 20px
    top 50%
    transform rotate(90deg)
    transition all 0.3s
    width 8px
*/
</style>

