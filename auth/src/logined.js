import Logined from "./Logined.svelte"

export default (svelte) => (anchor, props) => {
	props.s = svelte
	Logined(anchor, props)
}
