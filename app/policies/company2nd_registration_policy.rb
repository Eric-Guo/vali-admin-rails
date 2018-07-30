class Company2ndRegistrationPolicy < ApplicationPolicy
  def create_user?
    internal_user?
  end
end
