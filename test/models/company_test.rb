require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'Company harman valid' do
    harman = companies(:harman)
    assert harman.valid?
    assert_equal harman.users.count, 2
    assert_equal harman.vertical_markets.count, 2
  end

  test 'Company gbicc belongs to jiefu' do
    gbicc = companies(:gbicc)
    assert gbicc.valid?
    assert_equal gbicc.users.count, 1
    assert_equal gbicc.vertical_markets.count, 1
    assert_equal gbicc.managed_by_company.name, '一级供应商测试'
  end

  test 'Company jiefu has one managed company' do
    jiefu = companies(:jiefu)
    assert jiefu.valid?
    assert_equal jiefu.users.count, 1
    assert_equal jiefu.vertical_markets.count, 2
    assert_equal jiefu.managed_companies.count, 3
  end
end
