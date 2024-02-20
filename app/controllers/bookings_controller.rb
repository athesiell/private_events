class BookingsController < ApplicationController
  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking.attended_event, notice: 'You are now attending this event.'
    else
      render 'events/show'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.attended_events.delete(@event)
    redirect_to @event, notice: 'You will not attend this event'
  end

  private 

  def booking_params
    params.require(:booking).permit(:attended_event_id)
  end
end
