
CREATE TABLE IF NOT EXISTS products_tags(
    tag_id BIGINT,
    product_id BIGINT,
    CONSTRAINT pk_product_tag PRIMARY KEY (product_id, tag_id),
    CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE RESTRICT,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT
);


CREATE INDEX idx_tag_search ON products_tags (tag_id);