class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "作成しました"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "削除しました", status: :see_other
    else
      render :show
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :body)
  end
end
