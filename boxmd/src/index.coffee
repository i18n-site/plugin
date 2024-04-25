> @~3/box/htmBox.js
  @~3/md:Md
  @~3/svelte_mount:Mount

< (url)=>
  box = htmBox '<style>.uBox>div>b.w{margin-top:24px}</style><div style="max-height:calc(100vh - 128px);padding:0 24px 24px"></div>'
  box.style = 'max-width:750px'
  Mount(
    Md
    box.childNodes[2]
    {
      url
    }
  )
