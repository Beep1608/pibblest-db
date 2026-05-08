
--//TODO: 1. Considerar agregar un nuevo campo "totalQuantity" y otra "currentCuantity" para cada producto
--// asignado a la tienda
CREATE TABLE IF NOT EXISTS stores_products (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    store_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, 
    UNIQUE(store_id, product_id),

    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,

    CONSTRAINT chk_stores_quantity_positive CHECK (quantity => 0)
);