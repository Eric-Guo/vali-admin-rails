require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User valid' do
    eric = users(:eric)
    assert eric.valid?
    assert eric.companies.count == 1
    assert eric.courses.count == 1
  end
end
