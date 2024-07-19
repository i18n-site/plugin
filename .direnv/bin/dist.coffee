#!/usr/bin/env coffee

> zx/globals:
  fs > existsSync readFileSync writeFileSync copyFileSync
  path > join
  fs > rmSync
  @3-/mdt/make.js

$.verbose = true

cwd = process.cwd()

fp = (p)=>
  join cwd,p

src = fp 'src'
lib = fp 'lib'

RUN_SH = join cwd,'run.sh'

package_json = 'package.json'

if existsSync src
  if existsSync lib
    rmSync lib, {recursive:true}

  await $'./build.sh'

  if existsSync RUN_SH
    await $"#{RUN_SH}"

  package_json_fp = fp package_json
  json = JSON.parse readFileSync(
    package_json_fp
    'utf8'
  )

  {version} = json

  version = version.split('.')
  version.push parseInt(version.pop())+1
  json.version = version = version.join '.'

  writeFileSync(
    package_json_fp
    JSON.stringify json,null,2
  )

  delete json.devDependencies
  writeFileSync(
    join lib, package_json
    JSON.stringify(json).replaceAll('./lib/','./').replaceAll('"lib/','"./')
  )

  await make cwd
  readme_md = 'README.md'
  copyFileSync(
    fp readme_md
    join lib, readme_md
  )

  await $'git add -u'
  await $"git commit -m '#{json.name} v#{version}'"
  #await $'git push'
  cd lib
  await $'pnpm i&&pnpm publish --access=public --publish-branch $(git symbolic-ref --short -q HEAD)'
