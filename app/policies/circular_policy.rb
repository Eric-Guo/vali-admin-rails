class CircularPolicy < ApplicationPolicy
  def public_home?
    true
  end

  def index?
    internal_user?
  end
end
