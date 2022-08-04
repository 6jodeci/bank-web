postgres:
	docker run --name postgres14 -p 127.0.0.1:5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14.4-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root bank_db

dropdb:
	docker exec -it postgres14 dropdb bank_db

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/bank_db?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/bank_db?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: postgres createdb dropdb migrateup migratedown sqlc server 