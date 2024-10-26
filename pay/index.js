import logined from "@8p/auth/logined.js"

import { Path, URLLI } from "x/Match.js"

import menuUrl from "@8p/auth/menuUrl.js"

import { _$bill } from "~/lib/I18N.js"

import Bill from "./Bill.svelte"

import Pay from "./Pay.svelte"

menuUrl.payBill(_$bill, logined(Bill))

URLLI.push(Path.pay(logined(Pay)))
