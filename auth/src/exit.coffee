> x/user.js > setUser User
  @5-/auth > authExit

< (id)=>
  setUser if id then await authExit(id) else false
  return User()
