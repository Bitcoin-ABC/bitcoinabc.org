# Please note, this is a standard make file.  The rakefile is included for
# temporary purposes as it is currently used to generate translations.  The
# goal of this makefile is to avoid needing to install a ruby toolchain for
# casual contributors.

PROJECT ?= 
PORT ?= 8080

default: container

.PHONY: container
container:
	docker build -t $(PROJECT)bitcoinabcorg .

.PHONY: run
run: container
	docker run -it -p $(PORT):80 $(PROJECT)bitcoinabcorg:latest

serve: _config.yml
	bundler exec jekyll serve &
