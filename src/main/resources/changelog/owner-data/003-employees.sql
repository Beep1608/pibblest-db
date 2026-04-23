-- Crear tabla users
CREATE TABLE IF NOT EXISTS employees (
    id             SERIAL PRIMARY KEY, 
    username       VARCHAR(100) NOT NULL, 
    password       VARCHAR(100) NOT NULL,
    created_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_active_at TIMESTAMP WITH TIME ZONE,
    deleted_at     TIMESTAMP WITH TIME ZONE
);