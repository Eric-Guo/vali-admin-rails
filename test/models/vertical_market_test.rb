require 'test_helper'

class VerticalMarketTest < ActiveSupport::TestCase
  test 'Vertical Market akg valid' do
    akg = vertical_markets(:akg)
    assert akg.valid?
    assert akg.companies.count == 1
    assert akg.admin.name == 'Eric Guo'
  end
end
