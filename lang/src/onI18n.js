import bintxt from "x/bintxt.js"
import langHook from "x/langHook.js"
import { fBin } from "x/f.js"

/*
vite 打包时会自动锁定语言文件的版本号

  I18N_VER -> "@0.1.0/"

https://cdn.jsdelivr.net/npm/@i18n.site/i18n@0.1.1/zh.js
*/

export default langHook(async (lang) =>
	bintxt(await fBin(_I + "i18n" + I18N_VER + lang + ".js")),
)[0]
