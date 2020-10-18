require "minitest/autorun"
require "rack/test"

class TestApp < Minitest::Test
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  def test_root
    get 'http://localhost'
    assert last_response.ok?
  end
end
