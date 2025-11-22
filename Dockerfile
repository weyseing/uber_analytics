FROM mysql:8.0

# init scripts
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/02-import.sh

# env
ENV MYSQL_DATABASE=uberdb
ENV MYSQL_ROOT_PASSWORD=123456
