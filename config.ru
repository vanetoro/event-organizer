require './config/environment'

use Rack::MethodOverride
use HostController
use EventController
run ApplicationController
