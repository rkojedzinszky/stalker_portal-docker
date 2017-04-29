#!/bin/sh

DEF_GW=$(ip route | awk '/^default/ {print $3}')
if [ -n "$DEF_GW" ]; then
	sed -i -e "/RPAFproxy_ips/s,RPAFproxy_ips.*,RPAFproxy_ips $DEF_GW," \
		/etc/apache2/mods-available/rpaf.conf
fi

PWD="$(pwd)"

cd /var/www/html/stalker_portal/deploy && phing

cd "$PWD"

exec "$@"
