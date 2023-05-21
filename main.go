package main

import (
	"database/sql"
	"log"

	//"os"

	"github.com/WagaoCarvalhoDev/gofinance-backend/api"
	db "github.com/WagaoCarvalhoDev/gofinance-backend/db/sqlc"

	//"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

func main() {
	// err := godotenv.Load()
	// if err != nil {
	// 	log.Fatal("Error loading .env file")
	// }

	// dbDriver := os.Getenv("DB_DRIVER")
	// dbSource := os.Getenv("DB_SOURCE")
	// serverAddress := os.Getenv("SERVER_ADDRESS")

	dbDriver := "postgres"
	dbSource := "postgresql://super_admin:SomeSecretPassword@localhost:5432/go_finance?sslmode=disable"
	serverAddress := "0.0.0.0:8000"
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db: ", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(serverAddress)
	if err != nil {
		log.Fatal("cannot start api: ", err)
	}
}
