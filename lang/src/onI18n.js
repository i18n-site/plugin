import bintxt from "x/bintxt.js"
import langHook from 'x/langHook.js'
import fBinPrefix from "x/fBinPrefix.js"

import I18N from "~/lib/I18N.js"
import { I18N as PREFIX } from "~/conf.js"

const fI18n =  fBinPrefix(PREFIX)

export default langHook(
  async (lang) => bintxt(await fI18n(I18N[lang]))
)[0]
