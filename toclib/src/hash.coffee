< (elem)=>
  li = []
  if elem
    for h in elem.children
      {tagName:tag} = h
      if tag[0] == 'H' and tag.length == 2
        n = tag[1] - 0
        if n
          txt = h.innerText
          if txt
            t = [
              n
              txt
            ]
            {id} = h
            if id
              t.push id
            else
              for {id} in h.children
                if id
                  t.push id
                  break
            if t.length == 2
              h.id = 'H'+li.length
            li.push t
  return li
