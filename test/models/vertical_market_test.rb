require 'test_helper'

class VerticalMarketTest < ActiveSupport::TestCase
  test 'Vertical Market akg valid' do
    akg = vertical_markets(:akg)
    assert akg.valid?
    assert_equal akg.companies.count, 4
    assert_equal akg.admin.name, 'Eric Guo'
  end
end
