require 'test_helper'

class VerticalMarketTest < ActiveSupport::TestCase
  test 'Vertical Market akg valid' do
    akg = vertical_markets(:akg_mi)
    assert akg.valid?
    assert_equal akg.companies.count, 4
    assert_equal akg.courses.count, 4
    assert_equal akg.circulars.count, 2
    assert_equal akg.admin.name, 'Steve Gong'
  end
end
