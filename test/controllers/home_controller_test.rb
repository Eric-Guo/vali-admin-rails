require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:shin)
    get root_url
    assert_response :success
  end
end
