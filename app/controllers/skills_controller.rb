class SkillsController < ApplicationController
before_action :set_user, only: [:create, :new]

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    # @skill_order = SkillOrder.new
    # @skill_order.skill = @skill
    # @skill_order.user = @user
    @skill.available = true
    @skill.save

    if @skill.save
      redirect_to user_skills_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :price)
  end

  def set_user
    @user = User.find(params[:user_id])
  end


end
