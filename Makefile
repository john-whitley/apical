.PHONY: all composer.phar

all: composer.phar

composer.phar:
	@if [ ! -e composer.phar ]; then curl -sS https://getcomposer.org/installer | php; fi
	@find . -maxdepth 1 -name composer.phar -mtime +30 -execdir php {} self-update \;
