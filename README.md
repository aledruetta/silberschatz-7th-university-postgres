# silberschatz-7th-university-postgres

## Create and populate

```bash
sudo -u postgres psql
```

```sql
CREATE DATABASE university;
CREATE DATABASE large_university;
```

```bash
sudo -u postgres psql university < university.sql
sudo -u postgres psql large_university < large_university.sql
```

Or

```bash
sudo -u postgres psql university < dump.sql
sudo -u postgres psql large_university < large_dump.sql
```

## Dump

```bash
sudo -u postgres pg_dump university > dump.sql
sudo -u postgres pg_dump large_university > large_dump.sql
```

## Query

```bash
sudo -u postgres psql university
sudo -u postgres psql large_university
```

