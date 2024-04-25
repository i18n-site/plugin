#!/usr/bin/env coffee

> @3-/walk
  @3-/uridir
  path > sep basename dirname
  zx/globals:
  @3-/pool > Pool

ROOT = uridir import.meta

update = (fp)=>
  dir = dirname(fp)

  run = (cmd)=>
    $"sh -c 'cd #{dir} && #{cmd.split(' ')}'"

  await run 'ncu -u --dep peer,prod,dev,optional'
  await run 'pnpm i'
  return

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
    ].includes(name)
)
  if basename(fp) == 'package.json'
    POOL update,fp

await POOL.done
