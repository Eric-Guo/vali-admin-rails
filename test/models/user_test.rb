require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User valid' do
    eric = users(:eric)
    assert eric.valid?
    assert_equal eric.companies.count, 1
    assert_equal eric.courses.count, 1
  end
end
