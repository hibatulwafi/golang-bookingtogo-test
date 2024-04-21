package repository

import (
    "bookingtogo/internal/domain"
    "database/sql"
)

type CustomerRepository interface {
    GetCustomers() ([]domain.Customer, error)
    GetCustomerDetail(customerID int) (*domain.CustomerDetail, error)
}

type customerRepository struct {
    db *sql.DB
}

func NewCustomerRepository(db *sql.DB) CustomerRepository {
    return &customerRepository{
        db: db,
    }
}

func (r *customerRepository) GetCustomers() ([]domain.Customer, error) {
    query := `
        SELECT cst_id, cst_name, cst_dob, cst_phoneNum, cst_email, nationality_name
        FROM customers
        JOIN nationalities ON customers.nationality_id = nationalities.nationality_id
    `
    rows, err := r.db.Query(query)
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    var customers []domain.Customer
    for rows.Next() {
        var customer domain.Customer
        if err := rows.Scan(&customer.ID, &customer.Name, &customer.DOB, &customer.PhoneNum, &customer.Email, &customer.Nationality); err != nil {
            return nil, err
        }
        customers = append(customers, customer)
    }
    if err := rows.Err(); err != nil {
        return nil, err
    }
    return customers, nil
}

func (r *customerRepository) GetCustomerDetail(customerID int) (*domain.CustomerDetail, error) {
	query := `
			SELECT cst_name, cst_dob, cst_phoneNum, cst_email, nationality_name
			FROM customers
			JOIN nationalities ON customers.nationality_id = nationalities.nationality_id
			WHERE cst_id = ?
	`
	row := r.db.QueryRow(query, customerID)
	var customerDetail domain.CustomerDetail
	var customer domain.Customer
	if err := row.Scan(&customer.Name, &customer.DOB, &customer.PhoneNum, &customer.Email, &customer.Nationality); err != nil {
			return nil, err
	}
	customerDetail.Customer = customer

	familyQuery := `
			SELECT fl_name, fl_dob
			FROM family_lists
			WHERE cst_id = ?
	`
	rows, err := r.db.Query(familyQuery, customerID)
	if err != nil {
			return nil, err
	}
	defer rows.Close()

	for rows.Next() {
			var family domain.FamilyDetail
			if err := rows.Scan(&family.Name, &family.DOB); err != nil {
					return nil, err
			}
			customerDetail.Family = append(customerDetail.Family, family)
	}
	if err := rows.Err(); err != nil {
			return nil, err
	}

	return &customerDetail, nil
}

