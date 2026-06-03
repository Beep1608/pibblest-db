CREATE TABLE IF NOT EXISTS employee_permissions (
    employee_id    UUID NOT NULL,
    permission     VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (employee_id, permission),
    
    CONSTRAINT fk_employee_permissions_employee_id 
        FOREIGN KEY (employee_id) REFERENCES employees (id) ON DELETE CASCADE
);