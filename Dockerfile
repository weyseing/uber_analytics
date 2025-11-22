FROM mysql:8.0

# init scripts
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

# env
ENV MYSQL_DATABASE=uberdb
ENV MYSQL_ROOT_PASSWORD=123456
