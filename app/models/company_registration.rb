class CompanyRegistration
  include ActiveModel::Model
  FORM_FIELDS = %i[user_name user_title user_phone user_email user_password
                   co_name co_city co_province co_address vm_name].freeze
  attr_accessor(*FORM_FIELDS)
  validates_presence_of(*FORM_FIELDS)

  def save
    return false unless valid?
    true
  end
end
