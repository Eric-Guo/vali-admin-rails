require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'Company dicos valid' do
    dicos = companies(:dicos)
    assert dicos.valid?
    assert_equal dicos.users.count, 2
    assert_equal dicos.vertical_markets.count, 2
  end

  test 'Company gbicc belongs to citicprufunds' do
    gbicc = companies(:gbicc)
    assert gbicc.valid?
    assert_equal gbicc.users.count, 1
    assert_equal gbicc.vertical_markets.count, 1
    assert_equal gbicc.managed_by_company.name, '信诚基金'
  end

  test 'Company citicprufunds has one managed company' do
    citicprufunds = companies(:citicprufunds)
    assert citicprufunds.valid?
    assert_equal citicprufunds.users.count, 1
    assert_equal citicprufunds.vertical_markets.count, 2
    assert_equal citicprufunds.managed_companies.count, 1
    assert_equal citicprufunds.managed_companies.first.name, '吉贝克信息技术'
  end
end
