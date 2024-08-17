[‼️]: ✏️README.mdt

# @3-/github

如果绑定的用户或者github账号在githubUser中已经存在,并且uid不为0,那么就绑定失败

请帮忙创建以下mysql表,ts和各种id都用无符号大整数

githubUser
  id github的id
  uid 默认为0
  github_login varbinary(63)
  token varbinary(63)

githubUserFollowers
  id
  n
  ts 默认为当前unix时间戳

githubMail
  id
  github_user_id
  auth_mail_id
  primary bool

CREATE TABLE githubUser (
  id BIGINT UNSIGNED PRIMARY KEY,
  uid BIGINT UNSIGNED DEFAULT 0 NOT NULL,
  login VARBINARY(63) NOT NULL,
  token VARBINARY(63) NOT NULL
);

CREATE TABLE githubUserFollowers (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  github_user_id BIGINT UNSIGNED NOT NULL,
  n BIGINT UNSIGNED NOT NULL,
  ts BIGINT UNSIGNED DEFAULT UNIX_TIMESTAMP() NOT NULL,
);

CREATE TABLE githubMail (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  github_user_id BIGINT UNSIGNED NOT NULL,
  auth_mail_id BIGINT UNSIGNED NOT NULL,
  primary BOOL,
);

通过kvrocks的stream告知后台

后台用 XREAD 读取 BLOCK 设置为60 然后心跳
完成后用 XDEL key id 删除

后台会

1. 获取邮箱
2. 获取用户

忽略以 .noreply.github.com 结尾的


## TODO

赠送金改为抵扣额度, 每月清零

## About This Project

This project is an open-source component of [i18n.site ⋅ Internationalization Solution](https://i18n.site).

* [i18 : MarkDown Command Line Translation Tool](https://i18n.site/i18)

  The translation perfectly maintains the Markdown format.

  It recognizes file changes and only translates the modified files.

  The translated Markdown content is editable; if you modify the original text and translate it again, manually edited translations will not be overwritten (as long as the original text has not been changed).

* [i18n.site : MarkDown Multi-language Static Site Generator](https://i18n.site/i18n.site)

  Optimized for a better reading experience

## 关于本项目

本项目为 [i18n.site ⋅ 国际化解决方案](https://i18n.site) 的开源组件。

* [i18 :  MarkDown命令行翻译工具](https://i18n.site/i18)

  翻译能够完美保持 Markdown 的格式。能识别文件的修改，仅翻译有变动的文件。

  Markdown 翻译内容可编辑；如果你修改原文并再次机器翻译，手动修改过的翻译不会被覆盖（如果这段原文没有被修改）。

* [i18n.site : MarkDown多语言静态站点生成器](https://i18n.site/i18n.site) 为阅读体验而优化。