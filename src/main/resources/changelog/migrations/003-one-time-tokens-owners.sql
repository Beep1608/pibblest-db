CREATE TABLE IF NOT EXISTS identity.one_time_tokens_owners(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    token_value VARCHAR(255) NOT NULL,
    used BOOLEAN DEFAULT FALSE  NOT NULL,
    owner_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at TIMESTAMP WITH TIME ZONE , 
    CONSTRAINT fk_tokne_owner FOREIGN KEY(owner_id) REFERENCES identity.owners(id) ON DELETE RESTRICT

);