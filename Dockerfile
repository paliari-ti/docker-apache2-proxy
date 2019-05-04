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
    && mkdir -p /usr/local/apache2/proxies \
    && mkdir -p /usr/local/apache2/ssl \
    && echo "IncludeOptional conf/extra/000-default.conf" >> /usr/local/apache2/conf/httpd.conf \
    && echo "IncludeOptional proxies/*.conf" >> /usr/local/apache2/conf/httpd.conf

COPY ./000-default.conf /usr/local/apache2/conf/extra/000-default.conf

COPY ssl/server.key /usr/local/apache2/conf/server.key
COPY ssl/server.crt /usr/local/apache2/conf/server.crt

EXPOSE 443
