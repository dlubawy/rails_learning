class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    @event.save
    flash.notice = "Event created!"
    redirect_to user_path(current_user.id)
  end

  def show
    @event = Event.find(params[:id])
  end
end
