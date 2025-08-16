# Project Structure

## Root Files
- `main.rb` - Main Sinatra application with routes and database logic
- `config.ru` - Rack configuration file
- `Gemfile` - Ruby dependencies
- `Rakefile` - Rake tasks (database initialization)
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Multi-service orchestration
- `entrypoint.sh` - Docker entrypoint script

## Directory Structure

### `/config/`
- `schema.sql` - Database schema definition
- `puma.rb` - Puma web server configuration
- `unicorn.rb` - Unicorn web server configuration

### `/lib/`
Core business logic organized by domain:
- `highcharts.rb` - Main module loader
- `highcharts/builder.rb` - CSV to chart conversion logic
- `highcharts/chart.rb` - Chart data structure and serialization
- `highcharts/series.rb` - Chart series data handling
- `highcharts/series_factory.rb` - Series creation logic
- `highcharts/x_axis.rb` - X-axis configuration

### `/views/`
Slim templates for UI:
- `layout.slim` - Base layout with navigation and Foundation CSS
- `home.slim` - Homepage with CSV upload form and recent charts
- `chart.slim` - Chart display page with Highcharts rendering
- `form.slim` - Chart customization form
- `404.slim` - Error page

### `/public/`
Static assets organized by type:
- `css/` - Custom stylesheets
- `js/` - JavaScript libraries (jQuery, Vue.js)
- `foundation/` - Foundation CSS framework files
- `foundation-icons/` - Icon fonts and SVGs
- `highcharts/` - Highcharts library and modules

### `/nginx/`
Nginx reverse proxy configuration:
- `Dockerfile` - Nginx container setup
- `default.conf` - Nginx server configuration
- `entrypoint.sh` - Nginx startup script

### `/test/`
Test files organized by component:
- `test_helper.rb` - Test configuration
- `json_spec.rb` - JSON handling tests
- `highcharts/` - Highcharts library tests

## Code Organization Patterns

### Sinatra Application Structure
- Single `App` class inheriting from `Sinatra::Base`
- Routes organized by HTTP method and functionality
- Database connection handled via `db` helper method
- Environment-specific configuration in `configure` blocks

### Library Structure
- Modular design with `Highcharts` namespace
- Separate classes for different chart components
- Builder pattern for CSV to chart conversion
- Data structures that serialize to JSON for frontend

### View Structure
- Slim templates with minimal logic
- Foundation CSS for responsive design
- JavaScript embedded in templates for chart rendering
- Consistent navigation and layout structure