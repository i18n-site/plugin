<script lang="coffee">
> ./T.svelte
  x/_.js > fMd
  @3-/title_tip
  @8p/smnt:Mount
  @2-/route/setUrl.js
  @2-/route/selfA.js
  svelte > tick
  @2-/new:New
  @8p/toclib/toc.js:tocSM
  @8p/toclib/T.svelte:St
  @8p/toclib/scrollSync.js
  @3-/is_prefix:isPrefix
  @8p/shash

N = 'N'
W = 'W'
S = 'S'
NW = [N,W]

# set toc ver
< A
[set, toc, ver] = A

+ title, M, tip, h1a, ver, pre_b, unmount

onMount =>
  title = toc[0]
  if Array.isArray(title)
    [title, h1a] = title
  [title,tip] = TitleTip title
  await tick()

  pathname_i = =>
    pathname = location.pathname.slice(1)
    ali = M.getElementsByTagName('a')
    for i from ali
      if i.pathname == '/'+pathname
        return [pathname,i]

    for i from ali
      p = i.pathname.slice(1)
      if isPrefix pathname,p
        setUrl p
        return [p,i]
    return

  pi = pathname_i()
  if pi
    shash await setNow ...pi
  else
    set 0
  =>
    unmount?()
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

  if need_mount and pre_b == b # 防上面 await 期间点了其他章节
    if main
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
          [e,...b.getElementsByTagName('a')]
          ...args
        )
        return scroll
    pre_b.remove()
  return scroll


a = (e)=>
  pathname = location.pathname.slice(1)
  p = e.target
  while p
    if p.nodeName == 'A'
      if p.href
        url = selfA(p,e)
        if url
          {hash} = p
          e.preventDefault()
          setUrl(url)
          if hash
            url = url.slice(0,-hash.length)
          if url != pathname
            M.querySelectorAll('a.'+N).forEach (i)=>
              for c from [S, ...NW]
                i.classList.remove c
              return
            setNow url, p
          else if hash
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
      +if h1a
        a(href:h1a) { title }
        +else
          | { title }
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
      border-bottom 1px dashed #666
      color #666
      display inline-block
      margin-bottom 7px
      padding-bottom 0
      transition all 0.3s

      &:hover
        border-bottom 1px solid #00f
        color #00f

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

