package main

import (
	"bankapp/api"
	db "bankapp/db/sqlc"
	"bankapp/util"
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

func main() {
	// config in the same dir
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	conn, err := sql.Open(config.DBDriver, config.DBSourse)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	store := db.NewStore(conn)
	server := api.NewServer(store)
	err = server.Start(config.ServerAdress)
	if err != nil {
		log.Fatal("cannot start server", err)
	}
}
