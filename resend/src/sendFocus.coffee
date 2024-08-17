> @2-/tag0

< (resend, form)=>
  await resend()
  i = tag0(form,'input')
  i.focus()
  i.select()
  return
