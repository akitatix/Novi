class SkillsController < ApplicationController
before_action :set_skill, only: [:new, :create]

  def achat
    @skill = Skill.find(params[:skill_id])
    @skill.users = []
    @skill.users << current_user
    @skill.available = false
    @skill.save

    redirect_to skill_orders_path
    authorize @skill
  end

  def vente
    @skill = Skill.find(params[:skill_id])
    @skill.available = true
    @skill.save

    redirect_to skills_path
    authorize @skill
  end

  def index
    @skills = policy_scope(Skill)
  end

  def new
  end

  def destroy
    @skill = Skill.find(params[:id])
    authorize @skill
    @skill.destroy
    redirect_to skills_path
  end

  def edit
    @skill = Skill.find(params[:id])
    authorize @skill
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    authorize @skill
    redirect_to skill_path(@skill), notice: 'Article was successfully edited.'
  end

  def show
    @skill = Skill.find(params[:id])
    @reviews = Review.where(params[:id] == @skill.id)
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
    params.require(:skill).permit(:name, :description, :price, :photo)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.new
    authorize @skill
  end
end
