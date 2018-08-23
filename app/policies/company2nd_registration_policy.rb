class Company2ndRegistrationPolicy < ApplicationPolicy
  def create_user?
    first_level_vendor?
  end
end
