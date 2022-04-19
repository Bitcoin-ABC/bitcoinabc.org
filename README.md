# BitcoinABC.org Website

This is built using Github pages which uses Jekyll as a native static site framework.

It was not necessary to install Jekyll to build this.  It is simply a fork of an implementation
of the "beautiful Jekyll" theme.  Please refer upstream for helpful notes on using Jekyll and Github Pages.

# Basic Install Instructions

Install rvm: https://rvm.io/rvm/install

```
rvm install "$(cat .ruby-version)"
gem install jekyll bundler
bundle install
```

Then run the build locally:
```
bundle exec jekyll serve
```

# Providing Translations

1. Copy the file in `_posts/` that you wish to translate.
2. Set `lang` to the desired language code.
3. Verify that `multiLangId` is the same as the base filename **without** the language code.
4. Translate the file.

# Troubleshooting

## Permission issues when executing 'arc land'

If you are encountering various 'master not found on origin' or permission errors when attempting to land a diff for this website, then ensure your remotes are set to:
```
ssh://vcs@reviews.bitcoinabc.org:2221/source/bitcoin-abc-website.git
```
which can be verified via:
```
git remote -v
```
If you have a different remote connection for this website repo, update it:
```
git remote rm origin
git remote add origin ssh://vcs@reviews.bitcoinabc.org:2221/source/bitcoin-abc-website.git
```

