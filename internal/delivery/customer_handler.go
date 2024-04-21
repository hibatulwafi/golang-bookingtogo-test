package delivery

import (
    "bookingtogo/internal/usecase"
    "encoding/json"
    "net/http"
    "strconv" 

    "github.com/gorilla/mux"
)

type CustomerHandler struct {
    customerUsecase usecase.CustomerUsecase
}

func NewCustomerHandler(customerUsecase usecase.CustomerUsecase) *CustomerHandler {
    return &CustomerHandler{
        customerUsecase: customerUsecase,
    }
}

func (h *CustomerHandler) GetCustomers(w http.ResponseWriter, r *http.Request) {
    customers, err := h.customerUsecase.GetCustomers()
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(customers)
}

func (h *CustomerHandler) GetCustomerDetailHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    customerIDStr := vars["id"]
    customerID, err := strconv.Atoi(customerIDStr) 
    if err != nil {
        http.Error(w, "Invalid customer ID", http.StatusBadRequest)
        return
    }

    customerDetail, err := h.customerUsecase.GetCustomerDetail(customerID) 
    if err != nil {
        http.Error(w, "Failed to get customer detail", http.StatusInternalServerError)
        return
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(customerDetail)
}

func SetupRoutes(r *mux.Router, customerUsecase usecase.CustomerUsecase) {
    handler := NewCustomerHandler(customerUsecase)
    r.HandleFunc("/customers", handler.GetCustomers).Methods("GET")
    r.HandleFunc("/customers/{id}", handler.GetCustomerDetailHandler).Methods("GET")
}
