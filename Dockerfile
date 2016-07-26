FROM	alpine:3.4
MAINTAINER Carsten Ringe <carsten@kopis.de>

EXPOSE	80
VOLUME	["/dokuwiki-data", "/dokuwiki-conf"]

RUN	apk update && apk add -U php5-cli php5-mysqli php5-ctype php5-xml php5-gd php5-zlib php5-openssl php5-curl php5-opcache php5-json php5-ldap curl

ADD	docker-entrypoint.sh /docker-entrypoint.sh

# add local configuration onbuild from the user
ONBUILD ADD	local.php /dokuwiki-conf/
ONBUILD ADD	users.auth.php /dokuwiki-conf/
ONBUILD ADD	acl.auth.php /dokuwiki-conf/

CMD	["/docker-entrypoint.sh"]

