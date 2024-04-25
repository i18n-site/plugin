> ~/lib/SITE.js > ROUTE_LI
  @3-/urlli/i18nReset.js
  @3-/urlli/Re.js

< (PAGE)=>
  i18nReset ...ROUTE_LI.map (i)=>
    p = i.indexOf(' ')
    Re(
      i.slice(p+1)
      PAGE[i.slice(0,p)]
    )
  return
