class Company2ndRegistrationPolicy < ApplicationPolicy
  def create_user?
    first_level_vender?
  end
end
