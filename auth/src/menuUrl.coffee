> ./langCodeSvelte.js
  @8p/scrollc

export default new Proxy(
  {}
  get:(_,url)=>
    (lang_code, svelte)=>
      langCodeSvelte(url, lang_code, scrollc(svelte))
)
