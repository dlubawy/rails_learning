# Airports
Airport.create!(airport_code: "SFO")
Airport.create!(airport_code: "NYC")

# Flights
25.times do |n|
  to_airport_id = Airport.find(1).id
  from_airport_id = Airport.find(2).id
  datetime = Faker::Time.between(2.days.ago, 2.days.from_now)
  duration = 4 + Random.rand(4)
  Flight.create!(to_airport_id: to_airport_id,
                 from_airport_id: from_airport_id,
                 datetime: datetime,
                 duration: duration)
end

25.times do |n|
  to_airport_id = Airport.find(2).id
  from_airport_id = Airport.find(1).id
  datetime = Faker::Time.between(2.days.ago, 2.days.from_now)
  duration = 4 + Random.rand(4)
  Flight.create!(to_airport_id: to_airport_id,
                 from_airport_id: from_airport_id,
                 datetime: datetime,
                 duration: duration)
end
