.ONESHELL:
.SHELL := /bin/bash
.PHONY: ALL
.DEFAULT_GOAL := help
CURRENT_FOLDER=$(shell basename "$$(pwd)")
BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)
RESET=$(shell tput sgr0)

# Ensures that a variable is defined
define assert-set
  @[ -n "$($1)" ] || (echo "'$(1)' variable not defined in $(@)"; exit 1)
endef

# Ensures that a variable is undefined
define assert-unset
  @[ -z "$($1)" ] || (echo "'$(1)' variable should not be defined in $(@)"; exit 1)
endef

help: ## Help documentation
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy: ## Deploys the website to an S3 bucket
	aws s3 cp ./public s3://`terraform output bucket` --recursive --acl public-read

visit: ## Navigates to the S3 bucket's website
	open http://`terraform output website_endpoint`
