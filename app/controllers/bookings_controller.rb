class BookingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    current_user.attended_events << @event
    redirect_to @event, notice: 'You are attending this event'
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.attended_events.delete(@event)
    redirect_to @event, notice: 'You will not attend this event'
  end
end
