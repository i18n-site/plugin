<script lang="coffee">
> ~/lib/S.js
  @3-/render:
  @5-/captcha/proto.js > Captcha
  @2-/new:New

< req
< reject
< bin

+ h5, b, h5t

clear = =>
  b.innerHTML = ''
  b.style = ''
  h5 = 0
  b.onclick = =>
  return

< set = (bin)=>
  [id,img,svg_li] = Captcha(bin)
  h5 = clickCaptcha$.render (
    svg_li.map (d, p)=>
      if p == 2
        margin = '0 8px 0 8px'
      else
        margin = '0 0 0 8px'
      """<svg style="width:16px;margin:#{margin}" viewBox="0 0 1024 1024"><path d="#{d}"></path></svg>"""
  ).join ''
  b.innerHTML = ''
  b.style.background = 'url("'+URL.createObjectURL(new Blob([new Uint8Array(img)])).toString()+'") 0 0 / 420px no-repeat'
  id_set = new Set([1,2])
  xy = []
  b.onclick = (e)=>
    {target} = e
    if target.tagName == 'I'
      id_set.add +target.innerHTML
      target.remove()
      return
    {layerY,layerX} = e
    {size} = id_set
    n = if size then Math.min(...id_set) else 3
    p = (n-1)*2
    xy[p] = layerX
    xy[1+p] = layerY

    if size
      id_set.delete n
      {i} = New
      i.innerHTML = n
      i.style="top:#{layerY-15}px;left:#{layerX-15}px"
      b.appendChild(i)
    else
      clear()
      try
        await req [
          Number.parseInt(id)
          ...xy
        ]
      catch r
        reject r
    return
  return

render = =>
  try
    set await S.captcha()
  catch err
    reject err
  return

refresh = =>
  clear()
  render()
  return

onMount =>
  if bin
    set bin
    bin = undefined
  else
    render()
  return
</script>

<template lang="pug">
i
  +if h5
    h5 { @html h5 }
    a(@click=refresh title:>refresh)
    +else
      h5 >loading
        | #{ ' ' }···
b(@&b)
</template>

<style lang="stylus">
i
  align-items center
  display flex
  justify-content space-between
  padding 16px

  &>a
    background var(--svgRefresh) 0 0 / cover
    display flex
    height 20px
    opacity 0.4
    width 20px

    &:hover
      filter invert(42%) sepia(1) saturate(47)
      opacity 1

h5
  font-size 16px
  font-style normal
  margin 0 12px 0 0
  user-select none

b
  background var(--svgWait) 50% 50% / 180px no-repeat
  cursor cell
  display flex
  height 420px
  position relative
  width 420px

b>:global(i)
  align-items center
  background rgba(255, 0, 0, 0.9)
  border 3px solid #fff
  border-radius 15px
  box-shadow inset 0 0 7px #00000080
  color #fff
  cursor var(--svgXs) 10 10, pointer
  display flex
  font-family 'h'
  font-style normal
  font-weight 300
  height 24px
  justify-content center
  padding 0
  position absolute
  user-select none
  width 24px
</style>
