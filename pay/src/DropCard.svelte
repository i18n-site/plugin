<script lang="coffee">

< rm
< setDefault

+ id, aRm, p

onMount =>
  b = aRm.parentNode
  setTimeout =>
    loop
      b = b.previousSibling
      {value} = b
      if value
        id = +value
        p = b.parentNode
        if p.previousSibling.tagName != p.tagName
          setDefault = 0
        break
    return
  return
</script>

<template lang="pug">
+if setDefault
  a(@click={setDefault(p,id)}) >setDefault
a(@&aRm @click={rm(p,id)}) >rm
</template>

<style lang="stylus"></style>
