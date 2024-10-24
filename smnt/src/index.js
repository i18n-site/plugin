import { mount } from "svelte"

export default (svelte, target, props) => {
	const opt = { target }
	if (props) {
		opt.props = props
	}
	return mount(svelte, opt)
}
