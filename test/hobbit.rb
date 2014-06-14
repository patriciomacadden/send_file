require "hobbit"
require "rack/test"
require_relative "../lib/send_file"

FILE = File.join(__dir__, "foo.txt")

class App < Hobbit::Base
  include SendFile

  get '/' do
    send_file FILE
  end
end

class Cutest::Scope
  include Rack::Test::Methods

  def app
    App
  end
end

scope do
  test "sends the contents of the file" do
    get "/"

    assert_equal 200, last_response.status
    assert_equal "Hello World\n", last_response.body
  end

  test "sets response headers" do
    get "/"

    assert_equal "text/plain", last_response["Content-Type"]
    assert_equal "Hello World\n".length.to_s, last_response["Content-Length"]
    assert_equal File.mtime(FILE).httpdate, last_response["Last-Modified"]
  end
end
