DB_URL=postgresql://root:secret@localhost:5432/bank_db?sslmode=disable
network:
	docker network create bank-network
postgres:
	docker run --name postgres14 --network bank-network -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14.4-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root bank_db

dropdb:
	docker exec -it postgres14 dropdb bank_db

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

sqlc:
	sqlc generate

db_docs:
	dbdocs build doc/db.dbml 

db_schema:
	dbml2sql --postgres -o doc/schema.sql doc/db.dbml

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go bankapp/db/sqlc Store

##proto_path:
##export PATH="$PATH:$(go env GOPATH)/bin"

proto:
	rm -f pb/*.go
	rm -f doc/swagger/*.swagger.json
	rm -f doc/statik/*.go
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
	--go-grpc_out=pb --go-grpc_opt=paths=source_relative \
	--grpc-gateway_out=pb --grpc-gateway_opt=paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=simple_bank \
	proto/*.proto
	statik -src=./doc/swagger -dest=./doc

evans:
	./evans --host localhost --port 9090 -r repl

redis:
	docker run --name redis -p 6379:6379 -d redis:7-alpine

pingredis:
	docker exec -it redis redis-cli ping

.PHONY: network postgres createdb dropdb migrateup migratedown migrateup1 db_docs db_schema migratedown1 sqlc server mock proto evans redis pingredis
