class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date)
  end
end
