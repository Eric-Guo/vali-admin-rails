require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'should show index if sign in' do
    sign_in users(:shin)
    post create_user_companies_url, params: { user:
      { email: '2nd@company.com', name: '金无命', title: '剑客',
        phone: '13311825138', co_name: '金钱帮', city: '上海',
        district: '杨浦', address: '山庄', vm_id: vertical_markets(:akg).id,
        create_user_via_company_id: users(:eric).companies.first.id } }
    user = User.find_by! email: '2nd@company.com'
    assert_equal user.name, '金无命'
    assert_equal user.companies.first.name, '金钱帮'
    assert_response :redirect
  end
end
