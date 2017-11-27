class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    @photo = @post.photos.build
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      # if params[:photos] != nil
      #   params[:photos]['avatar'].each do |p|
      #     @photo = @post.photos.create(avatar: p)
      #   end
      # end
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @photos = @post.photos.all
  end

  private
  def post_params
    params.require(:post).permit(:name, :content, photos_attributes: [:id, :post_id, :avatar])
  end
end
