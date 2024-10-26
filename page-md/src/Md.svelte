<script lang="coffee">
> @8p/mc:Mc
  @8p/md:Md
  @8p/topbar/Mfsh.svelte

# svelte/internal > get_current_component

#= get_current_component()

url = location.pathname.slice(1)
</script>

<template lang="pug">
Mfsh
  Mc
    Md(url:)
</template>

<style lang="stylus"></style>

