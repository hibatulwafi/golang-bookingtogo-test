package usecase

import (
    "bookingtogo/internal/domain"
    "bookingtogo/internal/repository"
)

type CustomerUsecase interface {
    GetCustomers() ([]domain.Customer, error)
		GetCustomerDetail(customerID int) (*domain.CustomerDetail, error)

}

type customerUsecase struct {
    customerRepo repository.CustomerRepository
}

func NewCustomerUsecase(customerRepo repository.CustomerRepository) CustomerUsecase {
    return &customerUsecase{
        customerRepo: customerRepo,
    }
}

func (uc *customerUsecase) GetCustomers() ([]domain.Customer, error) {
    return uc.customerRepo.GetCustomers()
}

func (uc *customerUsecase) GetCustomerDetail(customerID int) (*domain.CustomerDetail, error) {
	return uc.customerRepo.GetCustomerDetail(customerID)
}