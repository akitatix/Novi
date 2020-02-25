class SkillsController < ApplicationController
before_action :set_skill, only: [:new, :create]
  def index
    @skills = policy_scope(Skill)
  end

  def new
  end

  def show
    @skill = Skill.find(params[:id])
    authorize @skill
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.users << current_user
    @skill.available = true
    @skill.save

    if @skill.save
      redirect_to skill_path(@skill), notice: 'Article was successfully created.'
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

  def set_skill
    @skill = Skill.new
    authorize @skill
  end
end
