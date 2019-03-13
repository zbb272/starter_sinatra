require_relative './config/environment'

use Rack::MethodOverride
use CitiesController
use CountriesController
run ApplicationController
