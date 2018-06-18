require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'Company dicos valid' do
    dicos = companies(:dicos)
    assert dicos.valid?
    assert dicos.users.count == 1
  end
end
