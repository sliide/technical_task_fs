# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This repository contains a technical task for full-stack developer candidates. It includes:
- A comprehensive task description (`TECHNICAL_TASK.md`)
- Docker-based PostgreSQL database setup
- Pre-configured hierarchical category data for testing

## Database Setup

### Starting the Database
```bash
docker-compose up -d
```

### Database Connection Details
- Host: localhost:5432
- Database: categories_db  
- Username: developer
- Password: devpassword

### Database Schema
The database contains a `categories` table with:
- `id` (SERIAL PRIMARY KEY)
- `name` (VARCHAR, UNIQUE)
- `description` (TEXT)
- `parent_id` (INTEGER, nullable foreign key to categories.id)
- `created_at`, `updated_at` (TIMESTAMP)

### Data Structure
The database is pre-populated with hierarchical category data:
- Sports > Football > Premier League, Champions League
- Sports > Basketball
- Entertainment > Movies, Music
- Technology > Programming > Web Development, Mobile Development
- Technology > Hardware

### Circular Reference Prevention
The database includes triggers to prevent circular references in the category hierarchy.

## Files Structure

- `TECHNICAL_TASK.md`: Complete task description for candidates
- `docker-compose.yml`: PostgreSQL database setup
- `database/init/01_create_tables.sql`: Database schema and constraints
- `database/init/02_seed_data.sql`: Sample hierarchical data
- `README.md`: Basic project information

## For Candidates

Candidates should read `TECHNICAL_TASK.md` for complete instructions. The task involves building a full-stack application to manage the hierarchical categories with the ability to view and modify parent-child relationships.