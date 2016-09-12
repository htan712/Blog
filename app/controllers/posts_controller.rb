class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
#        @posts = Post.include(:comments).all
        @posts = Post.all
    end
    
    def show
    end
    
    def new
        @post  = Post.new
    end
    
    def create 
        @post = Post.new post_params
        
        if @post.save
            redirect_to @post, notice: "Post Created."
        else
            render 'new', notice: "Unble to save post."
        end
    end
    
    def edit
    end
    
    def update
        if @post.update post_params
            redirect_to @post, notice: "Post Updated."
        else
            render 'edit', notice: "Update failed."
        end
    end
    
    def destroy
        @post.destroy
        redirect_to posts_path
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :content, :slug)
    end
    
    def find_post
        @post = Post.friendly.find(params[:id])
    end
end
