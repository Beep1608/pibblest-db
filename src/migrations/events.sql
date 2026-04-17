
DROP TABLE IF EXISTS events.event_publication;


CREATE SCHEMA IF NOT EXISTS events;

CREATE TABLE events.event_publication (
    id UUID NOT NULL,
    listener_id VARCHAR(512) NOT NULL,
    event_type VARCHAR(512) NOT NULL,
    serialized_event TEXT NOT NULL,
    publication_date TIMESTAMP WITH TIME ZONE NOT NULL,
    completion_date TIMESTAMP WITH TIME ZONE,
    
    -- ¡Aquí están las nuevas columnas que Modulith necesita!
    status VARCHAR(255) NOT NULL,
    completion_attempts INTEGER,
    last_resubmission_date TIMESTAMP WITH TIME ZONE,
    
    PRIMARY KEY (id)
);

-- 4. Índices para que los reintentos automáticos sean rapidísimos
CREATE INDEX IF NOT EXISTS event_publication_by_completion_date_idx 
ON events.event_publication (completion_date);