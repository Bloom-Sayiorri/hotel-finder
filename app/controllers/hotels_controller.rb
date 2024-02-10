class HotelsController < ApplicationController
    def index
        @hotel = Hotel.all
    end

    def show
        @hotel = find_hotel
        if @hotel.present?
            render json: @hotel, status: :ok
        else
            render json: {error: "Hotel not found"}, status: :not_found
        end
    end

    def create
        @hotel = Hotel.create(hotel_params)

        if @hotel
            render json: @hotel, status: :created
        else
            render json: @hotel.errors, status: :unprocessable_entity
        end
    end

    def update
        @hotel = find_hotel
        @hotel.update(hotel_params)
    end

    def destroy
        @hotel = find_hotel
        @hotel.destroy
        head :no_content
    end

    private
    def find_hotel
        Hotel.find(params[:id])
    end

    def hotel_params
        params.permit(:name, :location, :rating, :ammenities)
    end
end