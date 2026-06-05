CREATE TABLE IF NOT EXISTS sales (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    store_id BIGINT NOT NULL,
    employee_id UUID NOT NULL, -- Relación con el empleado que realizó la venta
    total_amount NUMERIC (12,2) NOT NULL DEFAULT 0.00,
    status VARCHAR(50) NOT NULL DEFAULT 'COMPLETED',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE, -- Borrado suave
    
    CONSTRAINT fk_sales_store FOREIGN KEY (store_id) REFERENCES stores (id) ON DELETE RESTRICT,
    CONSTRAINT fk_sales_employee FOREIGN KEY (employee_id) REFERENCES employees (id) ON DELETE RESTRICT
);