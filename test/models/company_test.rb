require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'Company dicos valid' do
    dicos = companies(:dicos)
    assert dicos.valid?
    assert dicos.users.count == 1
    assert dicos.vertical_markets.count == 2
  end
end
