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

Or

```bash
sudo -u postgres psql university < dump.sql
```

## Dump

```bash
sudo -u postgres pg_dump university > dump.sql
```

## Query

```bash
sudo -u postgres psql university
```

