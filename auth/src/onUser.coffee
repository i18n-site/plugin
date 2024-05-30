> ./auth.js > signIn
  @2-/cookie/set.js:cookieSet
  @2-/cookie/get.js:cookieGet
  @3-/lang/CODE.js
  @5-/auth > authMe authExit
  x/lang.js > set:langSet onSet:onLangSet
  @2-/conf/AUTH.js > set:setAuth
  ~/lib/S.js
  x/BC.js > send:bcSend hook:bcHook
  x/share.js > send:wSend hook:wHook
  # @2-/bc/bcHook.js
  # @2-/bc/toAll.js
  # @2-/share
  # @2-/share/swHook.js


HOOK = new Set

+ USER, LANG

{V} = cookieGet(document.cookie)
V = if V then parseInt(V, 36) else 0

save = =>
  t = [
    V
  ]
  if USER
    t.push ...USER
  else
    t.push USER

  localStorage.U = JSON.stringify(t)
  return

onLangSet (lang)=>
  if LANG != lang
    if USER and LANG != undefined
      S.authLang()
    LANG = lang
  return

_setUser = (user)=>
  if user
    lang = user[2]
    if lang != undefined
      lang = CODE[lang]
      if lang != LANG
        langSet LANG = lang
  else
    user = false
  USER = user
  HOOK.forEach(
    (f)=>
      f(user)
      return
  )
  return

< setUser = (user)=>
  if user and USER
    # 就是当前用户
    if user.every(
      (e, i)=>
        e == USER[i]
    )
      return

  cookieSet(
    'V'
    (
      ++V
    ) .toString(36)
  )
  _setUser user
  save()
  for f from [bcSend,wSend]
    f 0,user
  return


await do =>
  if not V
    USER = false
    return

  {U} = localStorage
  if U
    U = JSON.parse U
    if U[0] == V
      wSend(
        0
        USER = U[1] and U.slice(1)
      )
      return
  setUser await authMe()
  return

# 广播用户消息
bcHook(0,_setUser)
wHook(0,setUser)

export User = =>
  USER

export default (f)=>
  HOOK.add f
  f USER
  =>
    HOOK.delete f
    return

setAuth (next)=>
  f = =>
    next().finally =>
      HOOK.remove(f)
      return
    return
  HOOK.add f
  signIn()
  return
