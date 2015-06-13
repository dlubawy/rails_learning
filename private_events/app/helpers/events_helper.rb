module EventsHelper
  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
