# BitcoinABC.org Website

This is built using Github pages which uses Jekyll as a native static site framework.

It was not necessary to install Jekyll to build this.  It is simply a fork of an implementation
of the "beautiful Jekyll" theme.  Please refer upstream for helpful notes on using Jekyll and Github Pages.

# Basic Install Instructions

Install rvm: https://rvm.io/rvm/install

```
rvm install <version in .ruby-version file>
gem install jekyll bundler
bundle install
```

Then run the build locally:
```
bundle exec jekyll serve
```
