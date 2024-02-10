class RoomsController < ApplicationController
    def index 
        @room = Room.all
    end

    def create
        @room = Room.create(room_params)
        if @room
            render json: @room, status: :created
        else
            render json: @room.errors, status: :unprocessable_entity
        end
    end

    private
    def room_params
        Room.params(:room_number, :hotel_id)
    end
end
