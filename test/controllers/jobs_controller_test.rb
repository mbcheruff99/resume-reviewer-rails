require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  
  test "index" do
    get "/jobs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Job.count, data.length
  end
  
end
