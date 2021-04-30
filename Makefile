PROJECT := $(notdir $(CURDIR))
TAG ?= latest

# Build commands
DOCKER := docker  

# Files that when changed should trigger a rebuild.
SCRIPTS := $(shell find ./scripts -type f -name *.sh)

# Targets that don't result in output of the same name.
.PHONY: clean \
        build \
        start

# When no target is specified, the default target to run.
.DEFAULT_GOAL := start

# Target that returns the project to a clean state
clean:
	@rm $(CURDIR)/mailheader $(CURDIR)/msmtprc

# Target that creates a the mailheader file based on the template
mailheader:
	@cp $(CURDIR)/config/mailheader.template $(CURDIR)/mailheader

# Target that creates a the msmtprc file based on the template
msmtprc:
	@cp $(CURDIR)/config/msmtprc.template $(CURDIR)/msmtprc

# Target that builds the latest version of the container
build: $(SCRIPTS) Dockerfile
	@$(DOCKER) build . -t $(PROJECT):$(TAG)

# Target that runs the latest version of the container
start: build mailheader msmtprc
	@echo "Starting '$(PROJECT)'..."
	@$(DOCKER) run -it --rm -e RECIPIENT -v $(CURDIR)/mailheader:/mail-config/mailheader:ro -v $(CURDIR)/msmtprc:/etc/msmtprc:ro $(PROJECT):$(TAG)
