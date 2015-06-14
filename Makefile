GIT_ROOT:=$(shell git rev-parse --show-toplevel)

.PHONY: all composer.phar

all: vendor install-hooks

composer.phar:
	@if [ ! -e composer.phar ]; then curl -sS https://getcomposer.org/installer | php; fi
	@find . -maxdepth 1 -name composer.phar -mtime +30 -execdir php {} self-update \;
	@chmod a+x composer.phar

vendor: composer.phar
	./composer.phar install

install-hooks: vendor
	rm -f ${GIT_ROOT}/.git/hooks/pre-commit
	/bin/ln -s ${GIT_ROOT}/git-hooks/pre-commit ${GIT_ROOT}/.git/hooks/
