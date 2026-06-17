-- liquibase formatted sql

-- changeset owner:017-analytics-indexes
CREATE INDEX idx_sales_created_at_store ON sales (store_id, created_at) WHERE deleted_at IS NULL;
CREATE INDEX idx_sales_currency_store ON sales (currency_code, store_id);

-- rollback DROP INDEX idx_sales_created_at_store;
-- rollback DROP INDEX idx_sales_currency_store;
