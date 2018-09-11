class CompanyRegistration
  include ActiveModel::Model
  DEVISE_USER_EXT_FIELDS = %i[name title phone].freeze
  COMPANY_REG_FIELDS = %i[co_name city district address vm_ids].freeze
  FORM_FIELDS = (DEVISE_USER_EXT_FIELDS + COMPANY_REG_FIELDS).freeze
  attr_accessor(*COMPANY_REG_FIELDS)
  validates_presence_of(*COMPANY_REG_FIELDS)
  attr_writer :user

  def save
    return false unless valid?
    return false if Company.find_by(name: co_name).present?

    company = Company.find_or_create_by(name: co_name) do |co|
      co.district = district
      co.address = address
      co.city = city
      co.rank = 1
    end
    CompanyUser.find_or_create_by!(company: company, user: @user)
    vm_ids.reject(&:blank?).each do |vm_id|
      VerticalMarketCompany.find_or_create_by!(company: company, vertical_market_id: vm_id)
    end
    true
  end
end
