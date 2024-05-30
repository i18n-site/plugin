#!/usr/bin/env coffee

> @3-/walk
  @3-/uridir
  path > sep basename dirname
  zx/globals:
  @3-/pool > Pool

$.verbose = true

ROOT = uridir import.meta

update = (fp)=>
  dir = dirname(fp)

  $"sh -c 'cd #{dir} && ncu -u --dep peer,prod,dev,optional && pnpm i'"


POOL = Pool 8

for await fp from walk(
  ROOT
  (i)=>
    p = i.lastIndexOf(sep)
    name = i.slice(p+1)
    [
      '.pnpm'
      'node_modules'
      'target'
      '.direnv'
      '.git'
      'npm'
      'napi-rs'
      'lib'
    ].includes(name)
)
  if basename(fp) == 'package.json'
    await update fp

await POOL.done
