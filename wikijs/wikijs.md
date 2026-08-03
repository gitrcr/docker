# Wiki JS

## Postgresql

```bash
sudo -u postgres psql

-- Create a dedicated database user with a strong password
CREATE USER wikijs WITH PASSWORD 'StrongPasswordHere';

-- Create the database owned by that user
CREATE DATABASE wikijs OWNER wikijs;

-- Ensure UTF-8 encoding and correct locale (important for Wiki.js search)
ALTER DATABASE wikijs SET client_encoding TO 'UTF8';
ALTER DATABASE wikijs SET default_transaction_isolation TO 'read committed';
ALTER DATABASE wikijs SET timezone TO 'UTC';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE wikijs TO wikijs;
\q
```

test
```bash
psql -U wikijs -d wikijs -h 127.0.0.1 -W

```



## OpenShift
https://github.com/Requarks/wiki/blob/main/dev/openshift/Dockerfile
