
```shell
docker run --detach --name postgresql \
  --network pgsql_net   -p "5432:5432" \
  -e 'POSTGRES_INITDB_ARGS=--locale-provider=icu --icu-locale=fr-FR' \
  -e 'POSTGRES_PASSWORD=!ChangeMe!' \
  -e 'POSTGRES_USER=iut' \
  -v postgresql_data:/var/lib/postgresql \
  -v "./init:/docker-entrypoint-initdb.d" \
  -v "./data:/tmp" \
  cocagne/pgsql:2026-02
```

## Conventions


## Sources

- https://www.data.gouv.fr/datasets/contours-administratifs
