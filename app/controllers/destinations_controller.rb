class DestinationsController < ApplicationController
before_action :find_destination, only: [:show, :edit]
    
    def index
        @destinations = Destination.all
    end

    def show
    end

    def new
        @destination = Destination.new
        @destination.save
    end

    def create
        destination = Destination.create(destination_params)
        if destination.valid?
            redirect_to destination_path(destination)
        else
            flash[:errors] = destination.errors.full_messages
            redirect_to new_destination_path
        end
    end

    def edit
    end

    def update
        @destination.update
        redirect_to destination_path(@destination)
    end

    private

    def destination_params
        params.require(:destination).permit!
    end

    def find_destination
        @destination = Destination.find(params[:id])
    end

end