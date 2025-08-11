#  Full Stack Developer Technical Task

## CONGRATULATIONS your onto our next stage, the Sliide practical tests!
________________________________________________________________________
## Overview

You are tasked with building an internal tool for managing hierarchical categories. Digital content that we provide to the user get's tagged with these categories to help us provide personalised content which matches what the user interests. At the moment we don't have many categories but we're hoping to expand to many more to be able to produce the best content feeds for our users. This is an internal-only application that will not be exposed to external stakeholders or customers. The technology stack choice is entirely up to you.

## Categories

Our categories relate to each other such that more general categories like `sport` can have more specific children categories like `football` which may in turn have a child category of `the world cup` which is even more specific. 

`(the-world-cup) -chid-of-> (football) -child-of-> (sport)`

## Task Requirements

### Core Functionality
Build a full-stack application that allows users to:
1. **View the categories**
2. **Modify category relationships** by changing parent-child linkages between categories

### Database Structure
We've provided a PostgreSQL database with a `categories` table containing:
- `id` (SERIAL INTEGER, PRIMARY KEY)
- `name` (VARCHAR, UNIQUE)
- `description` (TEXT)
- `parent_id` (INTEGER, NULLABLE, foreign key referencing categories.id)

### Technical Constraints
- Use any frontend and backend technologies you're comfortable with
  - We'd love to see and hear what tools you think would be best for a company internal tool like this

## AI Tool Usage

We **encourage** you to use AI tools (ChatGPT, Claude, Copilot, etc.) to complete this task. However:

- You must **understand** the code you submit
- Include documentation showing **how you used AI**, such as:
  - Key prompts you used
  - Notes on how you guided the AI
  - Full conversation logs with the AI (if practical)

Create a file called `AI_USAGE.md` documenting your AI interaction approach.

## Submission Requirements

### Code Delivery
- **DO NOT** push your solution to our public GitHub repository
- Feel free to create either your own repository as a fork or **ZIP** your entire project directory and**EMAIL** the file to the recruiter

### Documentation Requirements
Your submission must include:

1. **README.md** with:
   - Clear setup instructions (assume we have a clean machine)
     - Provide **complete setup instructions** - don't assume we have your tools installed
     - **Bonus points** for easy setup (Docker, one-command setup, etc.)
     - Include any dependencies, environment variables, or configuration needed
   - How to run the application
   - Technology choices and reasoning
   - Any assumptions made

2. **AI_USAGE.md** with:
   - Documentation of AI tool usage
   - Key prompts or conversation excerpts
   - How you validated AI-generated code

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

## Time Expectation

This task should take approximately **2-3 hours** depending on your experience level and technology choices. Focus on creating a working solution rather than a perfect one (we all know that less better code > loads of worse code)

## Questions?

If you have any clarifications needed about the requirements, please reach out to your recruiter contact.

Good luck!