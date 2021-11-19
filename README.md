# silberschatz-7th-university-postgres

## Create and populate

```bash
sudo -u postgres psql
```

```sql
CREATE DATABASE university;
```

```bash
sudo -u postgres psql university < university.sql
```

## Dump

```bash
sudo -u postgres pg_dump university > dump.sql
```

