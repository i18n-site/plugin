> ./Li.svelte
  ./exit.js:_exit
  ./onUser.js > User
  @5-/auth > authExit
  @~3/box:Box
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
