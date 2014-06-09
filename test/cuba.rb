require "cuba/test"
require_relative "../lib/send_file"

FILE = File.join(__dir__, "foo.txt")

Cuba.plugin(SendFile)

Cuba.define do
  on root do
    send_file(FILE)
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
