class PostsController < ApplicationController
  before_filter :require_login, only: [:new, :create]
  
  def index
    @posts = Post.all    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user[:id]
    @post.save
    flash.notice = "Post Saved"
    redirect_to posts_path
  end
end
