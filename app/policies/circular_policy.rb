class CircularPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.super_admin?
        scope.all
      elsif user.admined_vm.present?
        scope.all
      elsif user.first_level_vendor?
        scope.all
      else
        scope.none
      end
    end
  end

  def public_home?
    true
  end

  def index?
    user&.super_admin?
  end

  def new?
    user&.super_admin?
  end

  def create?
    user&.super_admin?
  end

  def destroy?
    user&.super_admin?
  end
end
