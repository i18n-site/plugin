> @3-/on:On
  @2-/new:New

< =>
  {body} = document

  dialog = New.dialog
  dialog.className = 'uBox'
  On dialog,{
    close: =>
      body.removeChild(dialog)
      return
  }

  body.append dialog
  dialog.addEventListener(
    'cancel'
    (e) =>
      e.preventDefault()
      return
  )

  setTimeout => # 不这样 chrome 122.0.6261.129 在 vite 开发模式下有时候会没法显示在顶部
    dialog.showModal()
    return
  dialog
