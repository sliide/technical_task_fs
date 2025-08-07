-- Create the categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    parent_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create an index on parent_id for better query performance
CREATE INDEX idx_categories_parent_id ON categories(parent_id);

-- Create a function to prevent circular references
CREATE OR REPLACE FUNCTION prevent_circular_reference()
RETURNS TRIGGER AS $$
DECLARE
    current_parent INTEGER;
    visited INTEGER[];
BEGIN
    -- If parent_id is NULL, no circular reference possible
    IF NEW.parent_id IS NULL THEN
        RETURN NEW;
    END IF;
    
    -- Cannot set parent to self
    IF NEW.parent_id = NEW.id THEN
        RAISE EXCEPTION 'A category cannot be its own parent';
    END IF;
    
    -- Check for circular reference by traversing up the tree
    current_parent := NEW.parent_id;
    visited := ARRAY[NEW.id];
    
    WHILE current_parent IS NOT NULL LOOP
        -- If we find our own ID in the parent chain, it's circular
        IF current_parent = NEW.id THEN
            RAISE EXCEPTION 'Circular reference detected: category cannot be a descendant of itself';
        END IF;
        
        -- Prevent infinite loops in case of existing circular data
        IF current_parent = ANY(visited) THEN
            EXIT;
        END IF;
        
        visited := array_append(visited, current_parent);
        
        -- Get the parent of current_parent
        SELECT parent_id INTO current_parent 
        FROM categories 
        WHERE id = current_parent;
    END LOOP;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to enforce circular reference prevention
CREATE TRIGGER trigger_prevent_circular_reference
    BEFORE INSERT OR UPDATE ON categories
    FOR EACH ROW
    EXECUTE FUNCTION prevent_circular_reference();

-- Create a function to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to automatically update the updated_at field
CREATE TRIGGER trigger_update_updated_at
    BEFORE UPDATE ON categories
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at();