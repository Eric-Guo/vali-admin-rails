require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  test 'signup a user with new company registration' do
    get new_user_registration_path
    assert_response :success

    post user_registration_path, params: { user: { email: 'test@local.test' } }
    assert_response :success
    assert_select "body:match('data-alert', ?)", ''
  end
end
