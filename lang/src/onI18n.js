import { LANG_URL, NAV_LI, URL_LI_EXT } from "~/lib/SITE.js"
import { SiteLang } from "@5-/i18n-site-api"
import fMd from "~/lib/fMd.js"
import I18N from "~/lib/I18N.js"
import fI18n from "~/lib/fI18n.js"
import bintxt from "@3-/bintxt"
import uri from "./uri.js"
import URLMAP from "./URLMAP.js"

export const NAV = []

export default uri(async (lang) => {
	const [li, site_lang] = await Promise.all([
			fI18n(I18N[lang]),
			fMd(LANG_URL.get(lang)),
		]),
		[nav_i18n_li, url_v_li] = SiteLang(site_lang),
		dict = {}

	NAV.splice(0, NAV.length)
	NAV_LI.forEach((i, pos) => {
		const i18n = nav_i18n_li[pos]
		if (i18n) {
			NAV.push([`/${i}`, i18n])
		}
	})

	let pos = 0
	for (const [url_li, ext] of URL_LI_EXT) {
		let o = URLMAP.get(ext)
		if (!o) {
			o = new Map()
			URLMAP.set(ext, o)
		}
		for (const i of url_li) {
			const v = url_v_li[pos]
			if (v) {
				o.set(i, v)
			} else {
				o.delete(i)
			}
		}

		pos += 1
	}

	return bintxt(li)
})
