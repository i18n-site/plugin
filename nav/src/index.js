import { USE } from "x/_.js"
import i18nReset from "@3-/urlli/i18nReset.js"
import isPrefix from "@3-/is_prefix"

const match = ([prefix, compent]) => {
	if (prefix.endsWith("/")) {
		prefix = prefix.slice(0, -1)
	}
	return (url, render) => {
		if (isPrefix(prefix, url)) {
			render(compent)
			return 1
		}
	}
}
;(() => {
	const li = _NAV.map(([url, use]) => {
		return [url === "/" ? "" : url, USE[use]]
	})
	li.sort((a, b) => {
		return b[0].length - a[0].length
	})
	i18nReset(...li.map(match))
})()
