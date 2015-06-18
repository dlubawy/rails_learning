class Flight < ActiveRecord::Base
  belongs_to :to_airport, :class_name => "Airport"
  belongs_to :from_airport, :class_name => "Airport"

  def self.flight_dates
    all.collect {|f| [f.formatted_date, f.datetime.to_date]}.uniq
  end

  def self.search(params)
    if params[:search]
      Flight.where(from_airport_id: params[:from],
                   to_airport_id: params[:to])
            .on_date(params[:date].to_datetime)
            .includes(:from_airport, :to_airport)
    end
  end

  def self.on_date(date)
    where(datetime: date.beginning_of_day..date.end_of_day)
  end

  def formatted_date
    datetime.to_date.strftime("%m/%d/%y")
  end
end
