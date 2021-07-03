
Migration O2SWITCH => OVH
Serveur Maria DB 10.3.30 => MySQL v.5.6

Lors de la migration: perte de toutes les clés & auto-incréméntation, replacéees manuellement, après suppression, modification des doublons. Limites de tailles VARCHAR tolérées par Mysql < MariaDB.

https://dev.mysql.com/doc/refman/5.6/en/innodb-limits.html

By default, the index key prefix length limit is 767 bytes. See Section 13.1.13, “CREATE INDEX Statement”. For example, you might hit this limit with a column prefix index of more than 255 characters on a TEXT or VARCHAR column, assuming a utf8mb3 character set and the maximum of 3 bytes for each character. When the innodb_large_prefix configuration option is enabled, the index key prefix length limit is raised to 3072 bytes for InnoDB tables that use the DYNAMIC or COMPRESSED row format.

Attempting to use an index key prefix length that exceeds the limit returns an error. To avoid such errors in replication configurations, avoid enabling innodb_large_prefix on the source if it cannot also be enabled on replicas. 
