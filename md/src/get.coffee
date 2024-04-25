> ~/lib/fMdTxt.js
  @~3/lang/URLMAP.js

README = 'README'

< (path)=>
  if path == ''
    path = README

  md = URLMAP.get 'md'

  url = md.get path
  if not url
    url = md.get path+'/'+README

  if url
    return fMdTxt url

  return 0
