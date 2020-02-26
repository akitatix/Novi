class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create]
  before_action :set_skill, only: [:new,:create, :destroy, :update]
  def new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.skill = @skill
    @review.save

    if @review.save
      redirect_to skill_path(@skill), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to skill_path(@skill)
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    authorize @review
    redirect_to skill_path(@skill), notice: 'Article was successfully edited.'
  end


  def set_review
    @review = Review.new
    authorize @review
  end

  def set_skill
    @skill = Skill.find(params[:skill_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
