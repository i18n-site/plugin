{isArray} = Array

export default flat = (toc, push)=>
  for i from toc
    if isArray(i)
      if isArray(i[1])
        if isArray(i[0])
          push i[0]
        flat i[1], push
      else
        push i
  return

