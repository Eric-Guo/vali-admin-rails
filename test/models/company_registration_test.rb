require 'test_helper'

class CompanyRegistrationTest < ActiveSupport::TestCase
  test 'Company dicos valid' do
    form = CompanyRegistration.new
    assert_not form.valid?
  end
end
