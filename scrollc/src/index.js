import Mfs from "@8p/topbar/Mfs.svelte"

export default (svelte) => (anchor, props) => {
	props.C = svelte
	return Mfs(anchor, props)
}
