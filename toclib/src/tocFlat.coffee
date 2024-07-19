{isArray} = Array

flat = (toc, li)=>
  for i from toc
    if isArray(i)
      if isArray(i[1])
        if isArray(i[0])
          li.push i[0]
        flat i[1], li
      else
        li.push i
  return

< (toc)=>
  li = []
  flat(toc, li)
  return li
