require 'bundler'
Bundler.setup

namespace :jekyll do
  desc "serve jekyll site locally"
  task :serve do
    sh "bundle exec jekyll serve"
  end

  desc "build jekyll site"
  task :build do
    sh "bundle exec jekyll build"
  end

  desc "populate the user documentation"
  task :doc do
    sh "scripts/fetch_documentation.sh"
  end
end

namespace :docker do
  desc "build docker images"
  task :build => [:'jekyll:build'] do
    puts "Building bitcoincash docker image"
    sh "docker build -t bitcoinabcorg ."
  end
end

task :default => 'serve'
