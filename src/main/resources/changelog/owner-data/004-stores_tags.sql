CREATE TABLE IF NOT EXISTS stores_tags(
    tag_id BIGINT,
    store_id BIGINT,
    CONSTRAINT pk_store_tag PRIMARY KEY (store_id, tag_id),
    CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags_for_stores(id) ON DELETE RESTRICT,
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE RESTRICT
);


CREATE INDEX idx_store_tag_search ON stores_tags (tag_id);