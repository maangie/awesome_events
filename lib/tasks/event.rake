namespace :event do
  desc 'Event 中 start_time が明日より過去なら、先送りにする'
  task postpone: :environment do
    Event.where('start_time <= ?', Time.zone.tomorrow).each do |event|
      print event.name
      t = Time.zone.tomorrow
      b = Random.rand(t..t.next_year).beginning_of_day
      r1 = (b + 10.hours).to_i / 10.minute
      r2 = (b + 20.hours).to_i / 10.minute
      event.start_time = Time.at(Random.rand(r1..r2) * 10.minute)
      event.end_time = event.start_time + 1.hour
      puts event.start_time
      event.save
    end
  end
end
