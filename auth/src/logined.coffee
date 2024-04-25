> ./Logined.svelte

< (svelte)=>
  class extends Logined
    constructor: (opts)->
      opts.props.s = svelte
      super opts
