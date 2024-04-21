package domain

type Customer struct {
    ID        int    `json:"cst_id"`
    Name      string `json:"cst_name"`
    DOB       string `json:"cst_dob"`
    PhoneNum  string `json:"cst_phoneNum"`
    Email     string `json:"cst_email"`
    Nationality string `json:"nationality"`
}

type CustomerDetail struct {
    Customer
    Family []FamilyDetail `json:"keluarga"`
}

type FamilyDetail struct {
    Name string `json:"fl_name"`
    DOB  string `json:"fl_dob"`
}
