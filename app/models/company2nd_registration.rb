class Company2ndRegistration
  include ActiveModel::Model
  USER_FIELDS = %i[email name title phone create_user_via_company_id].freeze
  COMPANY_REG_FIELDS = %i[co_name city district address vm_ids].freeze
  FORM_FIELDS = (USER_FIELDS + COMPANY_REG_FIELDS).freeze
  attr_accessor(*FORM_FIELDS)
  validates_presence_of(*FORM_FIELDS)
  attr_writer :user
  validate :email_not_exist_in_user

  def save
    return false unless valid?
    @user = User.new(email: email, name: name, title: title, phone: phone)
    @user.skip_confirmation_notification!
    @user.save(validate: false)
    @user.lock_access!

    company = Company.find_or_create_by(name: co_name, city: city) do |co|
      co.district = district
      co.address = address
      co.managed_by_company_id = create_user_via_company_id
    end
    CompanyUser.find_or_create_by!(company: company, user: @user)
    vm_ids.reject(&:blank?).each do |vm_id|
      VerticalMarketCompany.find_or_create_by!(company: company, vertical_market_id: vm_id)
    end
    true
  end

  def email_not_exist_in_user
    errors.add(:email, I18n.t('user.email_duplicate')) if User.find_by(email: email).present?
  end
end
