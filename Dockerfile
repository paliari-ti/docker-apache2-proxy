FROM httpd:2.4

LABEL maintainer="Marcos Paliari <marcos@paliari.com.br>"

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_http.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_html.so\)/\1/' \
    /usr/local/apache2/conf/httpd.conf \
    && mkdir -p /usr/local/apache2/conf/proxies \
    && mkdir -p /usr/local/apache2/ssl \
    && echo "IncludeOptional conf/proxies/*.conf" >> /usr/local/apache2/conf/httpd.conf

ADD ssl/server.key /usr/local/apache2/conf/server.key
ADD ssl/server.crt /usr/local/apache2/conf/server.crt

VOLUME /usr/local/apache2/ssl
VOLUME /usr/local/apache2/conf/proxies

EXPOSE 443
