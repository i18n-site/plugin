> @2-/new:New

div = =>
  New.div

class TOAST
    constructor:->
        @_li = []
        @_offset = 0

    new : (msg, option={})->
      li = [...document.getElementsByTagName('dialog')]
      len = li.length
      + body
      if len > 0
        li.reverse()
        for i from li
          if i.open
            body = i
            break
      if not body
        body = document.body

      {timeout, body, close, html} = Object.assign(
          {
              timeout:9
              body
              close:1
          }
          option
      )

      li = @_li
      elem = div()
      elem.className = "animated fadeInLeft toast"
      elem.style.marginBottom = @_offset+'px'
      inner = div()
      if html
        inner.innerHTML = msg
      else
        inner.innerText = msg
      elem.appendChild inner
      if close
        close_i = New.i
        close_i.className = 'x'
        elem.appendChild close_i
      # elem = $ """<div class="" style=>#{msg}</div>"""
      li.push elem
      body.appendChild elem
      @_offset += (14+elem.offsetHeight)
      elem.close = close_func = =>
          elem.classList.add "fadeOutLeft"
          setTimeout(
              =>
                  li.splice li.indexOf(elem), 1
                  body.removeChild elem
                  offset = 0
                  for i,pos in li
                      i.style.marginBottom = offset+'px'
                      offset += (14+i.offsetHeight)
                  @_offset = offset
              500
          )
      if close
        close_i.onclick = close_func
      if timeout
        setTimeout(
            close_func
            timeout*1e3
        )
      return elem

TOAST = new TOAST()

export default toast = (args...)->
    TOAST.new(...args)

export toastErr = (args...)=>
  elem = toast(...args)
  elem.classList.add 'ERR'
  elem
