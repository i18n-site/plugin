> ./Body.svelte
  @2-/new:New

< =>
  {b} = New
  new Body({
    target: b
  })
  document.body.appendChild(b)
  return

