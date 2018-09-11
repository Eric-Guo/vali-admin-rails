require 'test_helper'

class VerticalMarketTest < ActiveSupport::TestCase
  test 'Vertical Market akg valid' do
    akg = vertical_markets(:akg)
    assert akg.valid?
    assert_equal akg.companies.count, 4
    assert_equal akg.courses.count, 4
    assert_equal akg.circulars.count, 2
    assert_equal akg.admin.name, '过纾逸'
  end
end
