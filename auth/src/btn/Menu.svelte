<script lang="coffee">
> ../Menu.js
  @8p/lang/onMount.js:onI18n

li = []
onMount onI18n(
  ->
    li = Menu.map (i)=>
      [
        @[i[0]],...i.slice(1)
      ]
    return
)
</script>

<template lang="pug">
+each li as [t,r]
  +if r.constructor == String
    a(href:r) { t }
    +else
      a(@click=r) { t }
</template>

<style lang="stylus"></style>
