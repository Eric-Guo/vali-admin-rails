require 'application_system_test_case'

class HomeDashboardsTest < ApplicationSystemTestCase
  test 'visiting the home dashboard' do
    visit root_url

    assert_selector 'h2', text: '哈曼培训报名系统'
    assert_selector 'button.btn-primary', text: '登录'
  end
end
