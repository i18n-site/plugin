> @~3/box:Box
  ~/lib/S.js > req
  ./Captcha.svelte

+ NOW

export captcha = (url, body, bin)=>
  if NOW
    if bin
      NOW[0].set bin
    return NOW[1]

  + svelte
  p = new Promise (resolve, reject)=>
    + err
    [box, svelte] = Box(
      Captcha
      {
        bin
        req:(captcha)=>
          opt = {
            headers:{
              'Content-Type':JSON.stringify(
                captcha
              )
            }
          }
          if body != undefined
            opt.body = body
          resolve await req(
            url
            opt
          )
          box.close()
          return
        reject:(_err)=>
          err = _err
          box.close()
          return
      }
    )
    box.onclose = =>
      NOW = undefined
      reject err
      return
    return
  NOW = [
    svelte
    p
  ]
  return p

< new Proxy(
  {}
  get:(_,url)=>
    (args...)=>
      if args.length
        body = JSON.stringify(args)
      captcha(
        url
        body
      )
)
