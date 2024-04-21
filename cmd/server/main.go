package main

import (
    "bookingtogo/internal/delivery"
    "bookingtogo/internal/repository"
    "bookingtogo/internal/usecase"
    "database/sql"
    "log"
    "net/http"

    _ "github.com/go-sql-driver/mysql"
    "github.com/gorilla/mux"
)

func main() {
    db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/bookingtogo")
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    customerRepo := repository.NewCustomerRepository(db)

    customerUsecase := usecase.NewCustomerUsecase(customerRepo)

    router := mux.NewRouter()
    delivery.SetupRoutes(router, customerUsecase)

    log.Println("Server started on :8080")
    http.ListenAndServe(":8080", router)
}
