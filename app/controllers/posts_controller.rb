class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :add_like]
    
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


    def update
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def add_like
        @post.likes += 1
        @post.is_liked = true
        @post.save
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