require 'rspec'
require 'yaml'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'flickr'

file_path = File.dirname(__FILE__) + '/config/api.yml'

if (File.exists?(file_path))
  Flickr.class_variable_set(:@@api_data, File.open(file_path) { |yf| YAML::load( yf ) })['api_key']
else
  raise IOError, 'You need to create the config/api.yml file containing your details first'
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end
