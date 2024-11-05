> x/htmBox.js
  @8p/md:Md
  @8p/smnt:Mount

< (url)=>
  box = htmBox '<style>.uBox>div>b.w{margin-top:24px}.uBox ol{margin-left:36px}</style><div style="max-height:calc(100dvh - 128px);padding:0 24px 24px"></div>'
  box.style = 'max-width:750px'
  Mount(
    Md
    box.childNodes[2]
    {
      url
    }
  )
