# frozen_string_literal: true
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/http_fixtures'
  config.allow_http_connections_when_no_cassette = true
  config.hook_into :webmock
end
