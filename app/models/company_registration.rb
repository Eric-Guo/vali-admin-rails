class CompanyRegistration
  include ActiveModel::Model
  DEVISE_USER_EXT_FIELDS = %i[name title phone].freeze
  COMPANY_REG_FIELDS = %i[co_name city district address vm_name].freeze
  FORM_FIELDS = (DEVISE_USER_EXT_FIELDS + COMPANY_REG_FIELDS).freeze
  attr_accessor(*FORM_FIELDS)
  validates_presence_of(*FORM_FIELDS)

  def save
    return false unless valid?
    true
  end
end
