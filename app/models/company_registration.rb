class CompanyRegistration
  include ActiveModel::Model
  DEVISE_USER_EXT_FIELDS = %i[name title phone].freeze
  COMPANY_REG_FIELDS = %i[co_name city district address vm_id].freeze
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
    VerticalMarketCompany.find_or_create_by!(company: company, vertical_market_id: vm_id)
    true
  end
end
