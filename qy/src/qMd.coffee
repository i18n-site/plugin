> x/_.js > vUrl trieN TRIE reset
  x/f.js > fTxt
  # ./Q.coffee > bind inited qUrl

MDLI = []
export default =>
  reset()
  # {lang} = document.documentElement
  MDLI.splice(0)
  await Promise.allSettled _P.map(
    ([prefix,ver], n)=>
      if !TRIE[n]
        await trieN(prefix, ver, n)
      trie = TRIE[n]
      mdUrl(prefix, trie[0], trie[1].md)
      return
  )
  return MDLI

export fMd = (lang, url, ver)=>
  fTxt vUrl(ver, lang+'/'+url+'.md')

# + LANG
#
# langUrl = ([ver, url])=>
#   vUrl(ver, LANG+'/'+url+'.md')
#
# MDLI = bind(
#   langUrl
#   =>
#     lang = reset()
#     if lang != LANG
#       LANG = lang
#       MDLI.splice(0)
#       await Promise.allSettled _P.map(
#         ([prefix,ver], n)=>
#           if !TRIE[n]
#             await trieN(prefix, ver, n)
#           trie = TRIE[n]
#           mdUrl(prefix, trie[0], trie[1].md)
#           return
#       )
#       inited()
#     return
# )


prefixK = (prefix, k)=>
  if prefix and k
    k = '/'+k
  return prefix+k

mdUrl = (prefix,ver_li,md)=>
  if not md
    return

  if Array.isArray md
    [md, sub] = md
    for [k,t] from Object.entries sub
      mdUrl(prefixK(prefix,k),ver_li,t)

  for [k,ver] from Object.entries md
    t = [
      prefixK(prefix,k)
      ver_li[ver]
    ]
    # qUrl langUrl t
    MDLI.push(t)

  return
