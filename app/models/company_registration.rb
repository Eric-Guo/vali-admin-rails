class CompanyRegistration
  include ActiveModel::Model
  DEVISE_USER_EXT_FIELDS = %i[name title phone].freeze
  COMPANY_REG_FIELDS = %i[co_name city district address vm_name].freeze
  FORM_FIELDS = (DEVISE_USER_EXT_FIELDS + COMPANY_REG_FIELDS).freeze
  attr_accessor(*COMPANY_REG_FIELDS)
  validates_presence_of(*COMPANY_REG_FIELDS)
  attr_writer :user

  def save
    return false unless valid?

    company = Company.find_or_create_by(name: co_name, city: city) do |co|
      co.district = district
      co.address = address
    end
    CompanyUser.find_or_create_by!(company: company, user: @user)
    vertical_market = VerticalMarket.find_by!(name: vm_name)
    VerticalMarketCompany.find_or_create_by!(company: company, vertical_market: vertical_market)
    true
  end
end
