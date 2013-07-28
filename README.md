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

Having difficulty getting this working on travis.
For some reason, git is not getting the new specially authorized
remote url.

Fails with:

```
Using worker: worker-linux-2-2.bb.travis-ci.org:travis-linux-6

$ export FOO="BAR"
$ export GH_REPO="medevice-users/gallery"
$ export GIT_NAME=[secure]
$ export GIT_EMAIL=[secure]
$ export GH_TOKEN=[secure]
travis_fold:start:git.1$ git clone --depth=50 --branch=master git://github.com/medevice-users/gallery.git medevice-users/gallery
Cloning into 'medevice-users/gallery'...
remote: Counting objects: 798, done.[K
[...]
travis_fold:end:installtravis_fold:start:before_script.1$ export REPO_URL="https://$GH_TOKEN@github.com/$GH_REPO.git"
travis_fold:end:before_script.1travis_fold:start:before_script.2$ ./prebuild.sh
HELLO WORLD set up medevice-users/gallery [via travis] for Ben West [via travis] <bewest@gmail.com>
STATUS
# HEAD detached at d797dbf
nothing to commit, working directory clean
remotes pre pre-authorized remote url
old	git://github.com/medevice-users/gallery.git (fetch)
old	git://github.com/medevice-users/gallery.git (push)
travis_fold:end:before_script.2$ docpad deploy-ghpages
[32minfo:[39m Welcome to DocPad v6.46.4
[32minfo:[39m Contribute: http://docpad.org/docs/contribute
[32minfo:[39m Plugins: cleanurls, coffeescript, eco, ghpages, jade, less, livereload, marked, paged, partials, related, stylus, text
[32minfo:[39m Environment: static
[32minfo:[39m Deployment to GitHub Pages starting...
[32minfo:[39m Generating...
[32minfo:[39m Generated 45/45 files in 6.74 seconds
Initialized empty Git repository in /home/travis/build/medevice-users/gallery/out/.git/

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <travis@testing-worker-linux-2-2-16953-linux-6.(none)>) not allowed
[31merror:[39m Something went wrong with the action
[31merror:[39m An error occured: 
Error: 
*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <travis@testing-worker-linux-2-2-16953-linux-6.(none)>) not allowed

    at ChildProcess.<anonymous> (/home/travis/build/medevice-users/gallery/node_modules/docpad-plugin-ghpages/node_modules/safeps/out/lib/safeps.js:154:21)
    at ChildProcess.EventEmitter.emit (events.js:98:17)
    at maybeClose (child_process.js:735:16)
    at Socket.<anonymous> (child_process.js:948:11)
    at Socket.EventEmitter.emit (events.js:95:17)
    at Pipe.close (net.js:466:12)

The command "docpad deploy-ghpages" exited with 1.

Done. Your build exited with 1.

```

Runs equivalent of?:

#### rough bash translation of `ghpages.plugin.coffee`

[`ghpages.plugin.coffee`](https://github.com/docpad/docpad-plugin-ghpages/blob/master/src/ghpages.plugin.coffee)

```bash

rootPath="./" # ?
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

