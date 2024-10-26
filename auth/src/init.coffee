> ./auth.js > signIn
  @2-/conf/AUTH.js > set:setAuth
  @5-/auth > authMe
  ~/lib/S.js
  x/user.js > onUser initUser
  # @2-/bc/bcHook.js
  # @2-/bc/toAll.js
  # @2-/share
  # @2-/share/swHook.js


await initUser(authMe, S.authLang)

setAuth (next)=>
  unbind = onUser =>
    next().finally(unbind)
    return
  signIn()
  return
