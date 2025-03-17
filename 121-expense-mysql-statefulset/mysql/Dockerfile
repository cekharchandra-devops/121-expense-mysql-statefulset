# FROM mysql:8.0.26
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
# RUN groupadd expense && \
#     useradd -g expense expense && \
#     chown -R expense:expense /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d
# ADD script/*.sql /docker-entrypoint-initdb.d
# USER expense

# FROM mysql:8.0.40
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
# COPY script/*.sql /docker-entrypoint-initdb.d/


FROM mysql:8.0.26

ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1

# Create user/group for application (Not for MySQL!)
# RUN groupadd expense && \
#     useradd -g expense expense

# Ensure MySQL directories have correct ownership
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d

# Copy database scripts
ADD script/*.sql /docker-entrypoint-initdb.d/

# Copy custom entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/

# Set execution permissions
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Use MySQL’s default user (do NOT change to "expense")
USER mysql

# Override entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
