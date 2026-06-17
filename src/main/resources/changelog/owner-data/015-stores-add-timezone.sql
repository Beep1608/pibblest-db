-- liquibase formatted sql

-- changeset owner:015-stores-add-timezone
ALTER TABLE stores ADD COLUMN timezone VARCHAR(50) NOT NULL DEFAULT 'UTC';
-- rollback ALTER TABLE stores DROP COLUMN timezone;
