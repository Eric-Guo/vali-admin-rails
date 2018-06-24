class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def create
    super do |user|
      if user.persisted?
        reg = CompanyRegistration.new user.attributes.slice(CompanyRegistration::FORM_FIELDS)
        unless reg.save
          user.destroy!
          user.errors.add(:base, :in_complete_company_registration)
        end
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: CompanyRegistration::FORM_FIELDS)
  end
end
