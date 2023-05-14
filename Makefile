createdb:
  createdb --username=super_admin --owner=super_admin go_finance

postgres:
  docker compose up

migrationUp:
  migrate -path db/migration -database "postgresql://super_admin:SomeSecretPassword@localhost:5432/go_finance?sslmode=disable" -verbose up

migrationDrop:
  migrate -path db/migration -database "postgresql://super_admin:SomeSecretPassword@localhost:5432/go_finance?sslmode=disable" -verbose drop

.PHONY: createdb postgres
