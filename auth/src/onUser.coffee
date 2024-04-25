> ./auth.js > signIn
  @2-/bc/bcHook.js
  @2-/bc/toAll.js
  @2-/share
  @2-/share/swHook.js
  @2-/cookie/get.js:cookieGet
  @3-/lang/CODE.js
  @5-/auth > authMe authExit
  @~3/lang/set.js:setLang > onSet:onLangSet
  @2-/conf/AUTH.js > set:setAuth
  ~/lib/S.js

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
        setLang LANG = lang
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
    if user.every(
      (e, i)=>
        e == USER[i]
    )
      return

  (
    await import('@2-/cookie/set.js')
  ).default(
    'V'
    (
      ++V
    ) .toString(36)
  )

  _setUser user
  save()
  for f from [toAll,share]
    f 0,user
  return

swHook[0] = (user)=>
  setUser user
  return

await do =>
  if not V
    USER = false
    return

  {U} = localStorage
  if U
    U = JSON.parse U
    if U[0] == V
      share(
        0
        USER = U[1] and U.slice(1)
      )
      return
  setUser await authMe()
  return

# 广播用户消息
bcHook(0,_setUser)

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
