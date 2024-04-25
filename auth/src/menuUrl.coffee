> @3-/urlli
  @3-/urlli/Path.js
  ./Menu.js

export default new Proxy(
  {}
  get:(_,url)=>
    (lang_code,svelte)=>
      Menu.unshift [
        lang_code
        url
      ]
      urlli Path[url](svelte)
      return
)
