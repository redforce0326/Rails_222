class ReservationsController < ApplicationController
    def index
       @reservation =  Reservation.where(user_id: current_user.id)
    end
    
    def confirm
        @reservation = Reservation.new(reservation_params_1)
        @room = Room.find_by(params[:rooms_id])
        @days = @reservation.amount_days
        @reservation.total_amount =  (@days.to_i * @reservation.people.to_i * @room.fee.to_i).to_s
    end
    
    def create
        @reservation = Reservation.new(reservation_params_2)
        @reservation.user = current_user
        @reservation.room_id = Room.find_by(params[:rooms_id]).id
        @room = Room.find_by(params[:rooms_id])
        if params[:back]
           render template: "rooms/show"
        elsif @reservation.save
          flash[:notice] = "予約が完了しました。"
          redirect_to("/reservations/#{@reservation.id}")
            
        else
          render("/reservations/confirm")
        end
    end
    
    def complete
        @room = Room.find_by(params[:rooms_id])
        @reservation = Reservation.find_by(params[:reserve_id])
    end
    
    
    
    def reservation_params_1
         params.require(:reservation).permit(
          :start_time,
          :end_time,
          :people,
      )
    end
    def reservation_params_2
         params.require(:reservation).permit(
          :start_time,
          :end_time,
          :total_amount,
          :people
      )
    end
end
