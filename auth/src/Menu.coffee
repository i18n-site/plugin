> ./Li.svelte
  ./exit.js:_exit
  x/user.js > User
  @5-/auth > authExit
  @8p/box:Box
  ~/lib/I18N.js > _$exit _$userAdmin

export default [
  [
    _$userAdmin
    => # admin
      Box Li
      return
  ]
  [
    _$exit
    => # exit
      _exit(User()?[0])
      return
  ]
]
