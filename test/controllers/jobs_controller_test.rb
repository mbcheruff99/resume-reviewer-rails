require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  
  test "index" do
    get "/jobs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Job.count, data.length
  end
  
  test "show" do
    get "/jobs/#{Job.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "location", "salary", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Job.count", 1 do
      post "/jobs.json", params: { title: "nurse", location: "Brooklyn", salary: "35/hr" }
      assert_response 201
    end
  end

  test "update" do
    job = Job.first
    patch "/jobs/#{job.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Job.count", -1 do
      delete "/jobs/#{Job.first.id}.json"
      assert_response 200
    end
  end

end
