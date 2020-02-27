class SkillPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a restaurant
  end

  def create?
    true  # Anyone can create a restaurant
  end

  def update?
    record.users.include? user  # Only restaurant creator can update it
  end

  def destroy?
    record.users.include? user  # Only restaurant creator can update it
  end

  def achat?
    true # Only restaurant creator can update it
  end

  def vente?
    true # Only restaurant creator can update it
  end

  def search?
    true
  end
end
