require 'test_helper'

class CircularTest < ActiveSupport::TestCase
  test 'Circular circular_2018 valid' do
    circular2018 = circulars(:circular2018)
    assert circular2018.valid?
    assert_equal circular2018.vertical_markets.count, 2
  end
end
