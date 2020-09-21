class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit]
    
    def index
        @bloggers = Blogger.all
    end

    def show
    end

    def new
        @blogger = Blogger.new
        @blogger.save
    end

    def create
        blogger = Blogger.create(blogger_params)
        if blogger.valid?
            redirect_to blogger_path(blogger)
        else
            flash[:errors] = blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def edit
    end

    def update
        @blogger.update
        redirect_to blogger_path(@blogger)
    end

    private

    def blogger_params
        params.require(:blogger).permit!
    end

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end


end