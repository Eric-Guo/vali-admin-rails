require 'test_helper'

class CircularTest < ActiveSupport::TestCase
  test 'Circular circular_2018 valid' do
    circular2018 = circulars(:circular2018)
    assert circular2018.valid?
  end
end
