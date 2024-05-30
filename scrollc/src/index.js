import slot from "@2-/svelte_slot"
import Mfs from "@8p/topbar/Mfs.svelte"

export default (svelte) => {
	return class extends Mfs {
		constructor(opts) {
			let { props } = opts
			if (!props) {
				opts.props = props = {}
			}
			props.$$scope = {}
			props.$$slots = { default: [slot(svelte)] }
			super(opts)
		}
	}
}
