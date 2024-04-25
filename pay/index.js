import logined from '@~3/auth/logined.js';

import urlli from '@3-/urlli';

import Path from '@3-/urlli/Path.js';

import menuUrl from '@~3/auth/menuUrl.js';

import {
  _$bill
} from '~/lib/I18N.js';

import Bill from './Bill.svelte';

import Pay from './Pay.svelte';

menuUrl.payBill(_$bill, logined(Bill));

urlli(Path.pay(logined(Pay)));
