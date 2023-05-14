createdb:
  createdb --username=super_admin --owner=super_admin go_finance

postgres:
  docker compose up

migrateup:
  migrate -path db/migration -database "postgresql://super_admin:SomeSecretPassword@localhost:5432/go_finance?sslmode=disable" -verbose up

migrationdrop:
  migrate -path db/migration -database "postgresql://super_admin:SomeSecretPassword@localhost:5432/go_finance?sslmode=disable" -verbose drop

test:
	go test -v -cover ./...

server:
	go run main.go

sqlc-gen:
	docker run --rm -v $$(pwd):/src -w /src kjconroy/sqlc generate

.PHONY: createdb postgres dropdb migrateup migrationdrop test server sqlc-gen
