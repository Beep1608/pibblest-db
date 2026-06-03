-- Crear tabla users
CREATE TABLE IF NOT EXISTS employees (
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
    name           VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100) NOT NULL,
    username       VARCHAR(100) NOT NULL, 
    password       VARCHAR(100) NOT NULL,
    role           VARCHAR(50) NOT NULL, -- Mapeado de EnumType.STRING
    created_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_active_at TIMESTAMP WITH TIME ZONE,
    deleted_at     TIMESTAMP WITH TIME ZONE
);

CREATE INDEX idx_employees_username ON employees(username);