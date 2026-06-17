-- liquibase formatted sql

-- changeset owner:016-sales-add-currency-code
ALTER TABLE sales ADD COLUMN currency_code VARCHAR(3) NOT NULL DEFAULT 'MXN';
-- rollback ALTER TABLE sales DROP COLUMN currency_code;
