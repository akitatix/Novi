class ReviewPolicy < ApplicationPolicy

  def create?
    true  # Anyone can create a restaurant
  end

  def update?
    record.user = user  # Only restaurant creator can update it
  end

  def destroy?
    record.user = user  # Only restaurant creator can update it
  end
end
