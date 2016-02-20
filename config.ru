require './app/unoconv_app'

use Rack::ShowExceptions
run UnoconvApp.new
