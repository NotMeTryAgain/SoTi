class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews.order(created_at: :desc).page(params[:page]).per(10)
    @rating_options = Review.ratings
    @review = Review.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post Edited!"
      redirect_to post_path(@post)
    else
      flash[:error] = 'Please complete the form correctly'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy!
      flash[:notice] = "Post deleted!"
      redirect_to posts_path
    else
      flash[:error] = "What happened?"
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :webseries_name,
      :link,
      :description,
      :link_to_trailer,
    )
  end
end
