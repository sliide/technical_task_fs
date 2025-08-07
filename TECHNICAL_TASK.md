# Full Stack Developer Technical Task

## Overview

You are tasked with building an internal tool for managing hierarchical categories. This is an internal-only application that will not be exposed to external stakeholders or customers. The technology stack choice is entirely up to you.

## Task Requirements

### Core Functionality
Build a full-stack application that allows users to:
1. **View categories** in a hierarchical tree structure
2. **Modify category relationships** by changing parent-child linkages between categories
3. **Navigate and understand** the category hierarchy visually

### Database Structure
We've provided a PostgreSQL database with a `categories` table containing:
- `id` (SERIAL INTEGER, PRIMARY KEY)
- `name` (VARCHAR, UNIQUE)
- `description` (TEXT)
- `parent_id` (INTEGER, NULLABLE, foreign key referencing categories.id)

**Important**: This structure forms a **tree hierarchy**, not a cyclical graph. Your solution should prevent or handle attempts to create circular references.

### Technical Constraints
- Use any frontend and backend technologies you're comfortable with
- The application should be intuitive for non-technical users
- Ensure data integrity (prevent circular references, handle edge cases)
- Include proper error handling and validation

## AI Tool Usage

We **encourage** you to use AI tools (ChatGPT, Claude, Copilot, etc.) to complete this task. However:

- You must **understand** all code you submit
- Include documentation showing **how you used AI**, such as:
  - Key prompts you used
  - Notes on how you guided the AI
  - Full conversation logs with the AI (if practical)
  - Explanations of AI-generated code you modified

Create a file called `AI_USAGE.md` documenting your AI interaction approach.

## Submission Requirements

### Code Delivery
- **DO NOT** push your solution to GitHub or any public repository
- **ZIP** your entire project directory
- **EMAIL** the ZIP file to your recruiter contact

### Documentation Requirements
Your submission must include:

1. **README.md** with:
   - Clear setup instructions (assume we have a clean machine)
   - How to run the application
   - Technology choices and reasoning
   - Any assumptions made

2. **AI_USAGE.md** with:
   - Documentation of AI tool usage
   - Key prompts or conversation excerpts
   - How you validated AI-generated code

### Setup Instructions
- Provide **complete setup instructions** - don't assume we have your tools installed
- **Bonus points** for easy setup (Docker, one-command setup, etc.)
- Include any dependencies, environment variables, or configuration needed

## Getting Started

### Database Setup
1. Ensure Docker and Docker Compose are installed:
   - [Install Docker Desktop](https://docs.docker.com/get-docker/) (includes Docker Compose)
   - Or install separately: [Docker](https://docs.docker.com/engine/install/) + [Docker Compose](https://docs.docker.com/compose/install/)
2. Run `docker-compose up -d` to start the PostgreSQL database
3. The database will be available at `localhost:5432`
   - Database: `categories_db`
   - Username: `developer`
   - Password: `devpassword`

The database comes pre-populated with sample hierarchical data.

### Exploring the Database
You can explore the categories table using psql:

```bash
# View all categories
docker exec categories_postgres psql -U developer -d categories_db -c "SELECT * FROM categories ORDER BY id;"

# Interactive psql session (use -it flags for interactive mode)
docker exec -it categories_postgres psql -U developer -d categories_db
```

## Evaluation Criteria

### Technical Implementation (40%)
- Code quality and organization
- Proper error handling and validation
- Database interaction and data integrity
- UI/UX design and usability

### Technology Choices (20%)
- Appropriate stack selection for an internal tool
- Justification of technology decisions
- Effective use of chosen technologies

### AI Integration (20%)
- Thoughtful use of AI tools
- Clear documentation of AI assistance
- Evidence of understanding AI-generated code

### Documentation & Setup (20%)
- Clear, complete setup instructions
- Good project documentation
- Easy-to-follow deployment process

## Time Expectation

This task should take approximately **4-8 hours** depending on your experience level and technology choices. Focus on creating a working solution rather than a perfect one.

## Questions?

If you have any clarifications needed about the requirements, please reach out to your recruiter contact.

Good luck!