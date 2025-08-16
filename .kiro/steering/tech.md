# Technology Stack

## Backend
- **Ruby 2.5+** - Main programming language
- **Sinatra 2.2** - Lightweight web framework
- **MySQL2** - Database adapter for MySQL
- **Slim** - Template engine for views
- **Puma** - Web server

## Frontend
- **Highcharts** - JavaScript charting library
- **Foundation CSS** - CSS framework
- **jQuery 2.1.4** - JavaScript library
- **Foundation Icons** - Icon font

## Infrastructure
- **Docker** - Containerization (Ruby 2.7 Alpine)
- **Docker Compose** - Multi-container orchestration
- **MySQL 5** - Database server
- **Nginx** - Reverse proxy/web server

## Development Tools
- **Bundler** - Ruby dependency management
- **Sinatra Reloader** - Auto-reload in development

## Common Commands

### Development Setup
```bash
# Install dependencies
bundle install

# Initialize database
rake initdb

# Run application (development)
bundle exec ruby main.rb

# Run with Docker Compose
docker-compose up
```

### Database
```bash
# Initialize database schema
rake initdb
```

### Docker
```bash
# Build and run all services
docker-compose up --build

# Run specific service
docker-compose up chartify
```

## Environment Variables
- `DB_HOST` - Database host
- `DB_USERNAME` - Database username  
- `DB_PASSWORD` - Database password
- `DB_DATABASE` - Database name
- `NGINX_PORT` - Nginx port (default: 8080)