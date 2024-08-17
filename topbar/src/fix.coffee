> ./topfix.js

< (m)=>
  { $$ } = m
  while $$
    m = $$.ctx[0]
    { $$ } = m

  topfix m

