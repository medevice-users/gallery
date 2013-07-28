# visualization gallery

For type 1 diabetes data.

Comparing and contrasting ways to look at data.

## Getting Started

1. [Install DocPad](https://github.com/bevry/docpad)
1. [Open http://localhost:9778/](http://localhost:9778/)
1. Start hacking away by modifying the `src` directory

[![Build Status](https://travis-ci.org/medevice-users/gallery.png?branch=master)](https://travis-ci.org/medevice-users/gallery)

## Useful

* https://gist.github.com/balupton/3939146
* http://rogerz.github.io/blog/2013/02/21/prose-io-github-travis-ci/
* https://github.com/rogerz/rogerz.github.com/blob/49e2c9c4b20748300a2db67a7b23a8a584cad86e/.travis.yml
* https://github.com/docpad/docpad-plugin-ghpages/blob/master/src/ghpages.plugin.coffee
* http://awestruct.org/auto-deploy-to-github-pages/

### docpad-plugin-ghpages

Runs equivalent of?:

```
rm -Rm out/.git
( cd $rootPath; 
  url=$(git config remote.origin.url)
  lastCommit=$(git log --oneline | head -n 1)
  git init
  git add .
  git commit -m $lastCommit
  git push --force $url master:gh-pages
)
```

## License

If you are wanting to open-source your website, we suggest using the
[Creative Commons Attribution
License](http://creativecommons.org/licenses/by/3.0/) for content and
the [MIT License](http://creativecommons.org/licenses/MIT/) for code.
In which case you'd probably want to use the following as your
license:

