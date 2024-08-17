import { USE } from "x/_.js"
import { i18nReset } from "x/Match.js"
import isPrefix from "x/isPrefix.js"

const match = ([compent, prefix]) => {
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
	const li = [],
		push = (use, url) => li.push([use, url === "/" ? "" : url])

	for (let [url, use, menu] of _NAV) {
		use = USE[use]
		if (menu) {
			const p = menu.indexOf(" ")
			if (~p) {
				url = menu.slice(p + 1)
				if (url) {
					url.split(",").forEach(push.bind(0, use))
					continue
				}
			}
		}
		push(use, url)
	}
	li.sort((a, b) => {
		return b[1].length - a[1].length
	})
	i18nReset(li.map(match))
})()
