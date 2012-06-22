source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'sqlite3', :group => :development
gem 'pg', :group => :production
gem 'jquery-rails'

# To use ActiveModel has_secure_password.
gem 'bcrypt-ruby', '~> 3.0.0'


# Gives you a form builder for easily building forms. Integrates well with Twitter Bootstrap.
# Documentation: https://github.com/plataformatec/simple_form
gem 'simple_form'

# Documentation Generation Gem.
# Run 'yard server --reload' which will automatically detect your changes. Runs on localhost:8808.
# Documentation: http://rubydoc.info/docs/yard/frames
gem 'yard'

# For pagination.
# Documentation: https://github.com/amatsuda/kaminari
gem 'kaminari'

# ===============
# = Assets Gems =
# ===============

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  
  # CSS & JQuery bootstrap package. Main source of styling in this project.
  # Documentation: http://twitter.github.com/bootstrap/
  gem "twitter-bootstrap-rails"
end

# ====================
# = Development Only =
# ====================

group :development do 
  # Annotates models with SQL table structure. In console, run command annotate.
  gem 'annotate', '2.4.1.beta1' # Use beta to get annotate to work with Rails 3.2. 
  
  # Creates nice pdfs of model relationships. 
  # Run by calling: 'rake erd' in command line.
  # Documentation: http://rails-erd.rubyforge.org/
  gem 'rails-erd'
  
  # Replaces rails console with pry.
  gem 'pry-rails'
end

# =========================
# = Development & Testing =
# =========================

group :development, :test do
  # RSpec testing framework.
  gem 'rspec-rails'
  
  # To use Factories instead of Fixtures in tests.
  gem 'factory_girl_rails'
  
  # To autorun tests.
  gem 'guard-rspec'
end

# ================
# = Testing Only =
# ================

group :test do
  # Generates fake data for factories.
  gem 'faker'
  
  # To test UI in code.
  gem 'capybara'
  
  # Helps run each test with a clean database.
  gem 'database_cleaner'
  
  # Opens your browser on demand to show what your application is rendering.
  gem 'launchy'
  
  # Adds addtional RSpec matchers that you can use in your tests.
  gem 'shoulda-matchers'
end
