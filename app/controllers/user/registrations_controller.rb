class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def create
    super do |user|
      if user.persisted?
        reg = CompanyRegistration.new params[:user].permit!.to_unsafe_hash.slice(*CompanyRegistration::COMPANY_REG_FIELDS)
        reg.user = user
        if reg.save
          user.lock_access!(send_instructions: false) if user.companies.any? { |co| co.approved_at.nil? }
        else
          user.destroy!
          user.errors.add(:base, :in_complete_company_registration)
        end
      end
    end
  end

  def after_inactive_sign_up_path_for(_user)
    Rails.application.routes.url_helpers.new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: Company2ndRegistration::FORM_FIELDS - [:vm_ids] + [vm_ids: []])
  end
end
