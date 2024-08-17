> ./Logined.svelte

< (svelte)=>
  class extends Logined
    constructor: (opts)->
      {props} = opts
      if not props
        opts.props = props = {}
      props.s = svelte
      super opts
