
CREATE SCHEMA IF NOT EXISTS identity;

CREATE TABLE identity.owners (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, 
    organization_code VARCHAR(10) UNIQUE,      
    is_active BOOLEAN DEFAULT TRUE,          
    last_login TIMESTAMP WITH TIME ZONE,
    schema_name VARCHAR(63) UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION owners.create_owners (schema_name TEXT ) RETURNS VOID AS $$ 
BEGIN

    -- 1. crear el esquema
    execute format('create schema if not exists %I', schema_name);

    -- 2. cambiar el path
    execute format('set local search_path to %I', schema_name);
    
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION identity.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;  $$ language plpgsql;

CREATE TRIGGER tr_owners_updated_at
    BEFORE UPDATE ON identity.owners
    FOR EACH ROW
    EXECUTE FUNCTION identity.update_updated_at_column();