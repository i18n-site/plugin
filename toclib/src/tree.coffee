export default (li)=>
  if not li.length
    return

  li0 = li.shift()
  pre = li0[0]
  now = [[li0[1],li0[2] or 'H0']]
  root = now
  up = []

  pos = 0
  for [n,title,rel] from li
    ++pos
    tr = [title, rel or 'H'+pos]
    if n < pre
      loop
        t = up.pop()
        if not t
          break
        [t,now] = t
        if t <= n
          break
      now.push tr
    else if n > pre
      now.push [
        now.pop()
        t = [tr]
      ]
      up.push [pre,now]
      now = t
    else
      now.push tr
    pre = n
  if root.length > 1 or Array.isArray(root[0][0])
    return root
  return

