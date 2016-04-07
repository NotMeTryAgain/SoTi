class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to post_path(@review.post)
    else
      flash[:error] = @review.errors.full_messages.join(", ")
      redirect_to post_path(@review.post)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @post = @review.post
    if @review.destroy!
      flash[:notice] = "Review deleted!"
      redirect_to posts_path
    else
      flash[:error] = "What happened?"
      redirect_to post_path(@review.post)
    end
  end

  def edit
    session[:edit] = true
    @review = Review.find(params[:id])
    redirect_to post_path(@review.post)
  end

  def update
    @review = Review.find(params[:id])
    @post = @review.post
    if @review.update(review_params)
      flash[:notice] = "Review Edited!"
      redirect_to post_path(@post)
    else
      flash[:error] = "Review edits not saved."
      redirect_to posts_path(@post)
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :body
    ).merge(post: Post.find(params[:post_id]), user: current_user)
  end
end
