class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit]
    
    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
        @post.save
    end

    def create
        post = Post.create(post_params)
        if post.valid?
            redirect_to post_path(post)
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
    end

    def increment_likes
        @post.likes += 1
        @post.update 
    end

    def update
        @post.update
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit!
    end

    def find_post
        @post = Post.find(params[:id])
    end
end