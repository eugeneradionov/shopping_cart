$:.push File.expand_path('../lib', __FILE__)

# Maintain your s.add_development_dependency's version:
require 'shopping_cart/version'

# Describe your s.add_development_dependency and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'shopping_cart'
  s.version     = ShoppingCart::VERSION
  s.authors     = ['Yevhen Radionov']
  s.email       = ['eugene.radionov@gmail.com']
  s.homepage    = 'https://github.com/eugeneradionov/shopping_cart'
  s.summary     = 'Simple Rails cart engine'
  s.description = 'Simple Rails cart engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'haml', '~> 5.0', '>= 5.0.1'
  s.add_dependency 'sass', '~> 3.5', '>= 3.5.1'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'country_select', '~> 3.1'
  s.add_dependency 'aasm', '~> 4.12', '>= 4.12.2'
  s.add_dependency 'cancancan', '~> 2.0'
  s.add_dependency 'devise', '~> 4.3'
  s.add_dependency 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
  s.add_dependency 'jquery-rails', '~> 4.3', '>= 4.3.1'

  s.add_development_dependency 'pry-rails', '~> 0.3.4'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'capybara', '~> 2.17'
  s.add_development_dependency 'transactional_capybara', '~> 0.2.0'
  s.add_development_dependency 'database_cleaner', '~> 1.6', '>= 1.6.1'
  s.add_development_dependency 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  s.add_development_dependency 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
  s.add_development_dependency 'ffaker', '~> 2.6'
  s.add_development_dependency 'sqlite3'

  s.test_files = Dir['spec/**/*']
end
