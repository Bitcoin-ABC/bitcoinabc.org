# Please note, this is a standard make file.  The rakefile is included for
# temporary purposes as it is currently used to generate translations.  The
# goal of this makefile is to avoid needing to install a ruby toolchain for
# casual contributors.

PORT ?= 8080
TAG = bitcoin-abc-org

default: container

.PHONY: container
container:
	docker build -t $(TAG) .

.PHONY: run
run: container
	docker run -it -p $(PORT):80 $(TAG)

serve: _config.yml
	bundler exec jekyll serve
