> ./set.js
  ~/lib/SITE.js > LANG_URL

{LANG} = localStorage
if not LANG_URL.has LANG
  for i from navigator.languages
    if LANG_URL.has i
      LANG = i
      break
    l = i.slice(0,i.indexOf('-'))
    if LANG_URL.has l
      LANG = l
      break
  if not LANG
    LANG = LANG_LI[0][1]

set LANG

export default LANG
