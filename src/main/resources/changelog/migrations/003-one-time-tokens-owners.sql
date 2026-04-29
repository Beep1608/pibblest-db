CREATE TABLE IF NOT EXISTS identity.one_time_tokens_owners (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    token_value VARCHAR(255) UNIQUE NOT NULL, 
    
    used BOOLEAN DEFAULT FALSE NOT NULL,
    expired BOOLEAN DEFAULT FALSE NOT NULL,
    owner_id UUID NOT NULL,
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,

    expires_at TIMESTAMP WITH TIME ZONE NOT NULL, 
    
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    

    CONSTRAINT fk_token_owner FOREIGN KEY(owner_id) REFERENCES identity.owners(id) ON DELETE RESTRICT
);


CREATE INDEX idx_tokens_owner_active 
ON identity.one_time_tokens_owners (owner_id) 
WHERE expired = false AND used = false;