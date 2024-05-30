export default (_onMount)=>
  =>
    + unmount
    _onMount().then(
      (r)=>
        if unmount
          r?()
        else
          unmount = r
        return
    )
    =>
      if unmount
        unmount()
      else
        unmount = 1
      return
