require 'bundler'
Bundler.setup

namespace :jekyll do
	desc "serve jekyll site locally"
	task :serve do
	  sh "bundle exec jekyll serve"
	end
	
	desc "serve jekyll site locally"
	task :build do
	  sh "bundle exec jekyll build"
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
