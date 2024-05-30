> @3-/urlli
  @3-/urlli/Path.js
  ./Menu.js

< (url,lang_code,svelte)=>
  Menu.unshift [
    lang_code
    '/'+url
  ]
  urlli Path[url](svelte)
  return
