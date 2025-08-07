# Setup Guide for Recruiters

This guide explains how to set up and provide the technical task to candidates.

## Quick Setup

1. **Provide the entire repository** to candidates (zip it and send, or give them access to clone)

2. **Candidates should start here**: Direct them to read `TECHNICAL_TASK.md` for complete instructions

3. **Database verification** (optional): You can verify the database setup works by:
   ```bash
   docker-compose up -d
   docker exec -it categories_postgres psql -U developer -d categories_db -c "SELECT * FROM categories ORDER BY id;"
   
   # Or view the data in a hierarchical structure
   docker exec categories_postgres psql -U developer -d categories_db -c "
   WITH RECURSIVE category_tree AS (
   SELECT id, name, description, parent_id, 0 as level, name::TEXT as path
   FROM categories WHERE parent_id IS NULL
   UNION ALL
   SELECT c.id, c.name, c.description, c.parent_id, ct.level + 1, (ct.path || ' > ' || c.name)::TEXT
   FROM categories c JOIN category_tree ct ON c.parent_id = ct.id
   )
   SELECT REPEAT('  ', level) || name as indented_name, description, level
   FROM category_tree ORDER BY path;"
   ```


## What Candidates Get

- Complete task description in `TECHNICAL_TASK.md`
- Working PostgreSQL database with Docker setup
- Pre-populated hierarchical test data
- Database schema with circular reference prevention

## Expected Deliverables

Candidates should provide:
1. **ZIP file** with their complete solution (not pushed to GitHub)
2. **README.md** with setup and run instructions
3. **AI_USAGE.md** documenting their AI tool usage
4. Working full-stack application that can view and modify category hierarchies

## Evaluation Points

- **Technical implementation**: Code quality, error handling, data integrity
- **Technology choices**: Appropriate stack selection and justification  
- **AI integration**: Thoughtful use and documentation of AI assistance
- **Documentation**: Clear setup instructions and project documentation

## Time Expectation

4-8 hours depending on candidate experience level.

## Support

If candidates have questions about requirements, they should contact you directly.