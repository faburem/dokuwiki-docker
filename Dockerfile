FROM	alpine:3.3
MAINTAINER Carsten Ringe <carsten@kopis.de>

EXPOSE	80
VOLUME	["/dokuwiki-data", "/dokuwiki-conf"]

RUN	apk update && apk add -U php-cli php-mysqli php-ctype php-xml php-gd php-zlib php-openssl php-curl php-opcache php-json php-ldap curl

ADD	docker-entrypoint.sh /docker-entrypoint.sh

# add local configuration onbuild from the user
ONBUILD ADD	local.php /dokuwiki-conf/
ONBUILD ADD	users.auth.php /dokuwiki-conf/
ONBUILD ADD	acl.auth.php /dokuwiki-conf/

CMD	["/docker-entrypoint.sh"]

