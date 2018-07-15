require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'Company dicos valid' do
    dicos = companies(:dicos)
    assert dicos.valid?
    assert dicos.users.count == 1
    assert dicos.vertical_markets.count == 2
  end

  test 'Company gbicc belongs to citicprufunds' do
    gbicc = companies(:gbicc)
    assert gbicc.valid?
    assert gbicc.users.count == 1
    assert gbicc.vertical_markets.count == 1
    assert gbicc.managed_by_company.name == '信诚基金'
  end

  test 'Company citicprufunds has one managed company' do
    citicprufunds = companies(:citicprufunds)
    assert citicprufunds.valid?
    assert citicprufunds.users.count == 1
    assert citicprufunds.vertical_markets.count == 2
    assert citicprufunds.managed_companies.count == 1
    assert citicprufunds.managed_companies.first.name == '吉贝克信息技术'
  end
end
