class Company2ndRegistrationPolicy < ApplicationPolicy
  def create_2nd_vendor?
    first_level_vendor?
  end
end
