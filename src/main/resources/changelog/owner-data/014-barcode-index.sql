CREATE UNIQUE INDEX IF NOT EXISTS uq_products_barcode_notnull 
ON products(barcode) 
WHERE barcode IS NOT NULL AND deleted_at IS NULL;
