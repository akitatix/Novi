class SkillOrdersController < ApplicationController

  def index
    @skill_orders = policy_scope(SkillOrder)
  end
end
