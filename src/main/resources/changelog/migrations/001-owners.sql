CREATE SCHEMA IF NOT EXISTS identity;

CREATE TABLE IF NOT EXISTS identity.owners (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company            TEXT,
    name              VARCHAR(100) NOT NULL,
    last_name         VARCHAR(100) NOT NULL,
    email             VARCHAR(255) UNIQUE NOT NULL,
    verified_at       TIMESTAMP,
    password          VARCHAR(255) NOT NULL,
    organization_code VARCHAR(10) UNIQUE,
    is_active         BOOLEAN DEFAULT TRUE,
    last_login        TIMESTAMP WITH TIME ZONE,
    schema_name       VARCHAR(63) UNIQUE,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);



CREATE OR REPLACE FUNCTION identity.update_updated_at_column() 
RETURNS TRIGGER AS $$ 
BEGIN 
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_owners_updated_at ON identity.owners;

CREATE TRIGGER tr_owners_updated_at 
BEFORE UPDATE ON identity.owners 
FOR EACH ROW 
EXECUTE FUNCTION identity.update_updated_at_column();