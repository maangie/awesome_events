# This file should contain all the record creation needed to seed the
# database with its default values.
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
owner_id = User.first.id
CSV.foreach('db/sample.tsv', col_sep: "\t") do |row|
  puts row[0]
  e = Event.new
  e.owner_id = owner_id
  e.name = row[0]
  e.place = row[1]

  t = Time.zone.tomorrow
  e.start_time =
    Time.at(Random.rand(t..t.next_year).beginning_of_day +
            (Random.rand(0..10) + 10) * 1.hour)

  e.end_time = e.start_time + Random.rand(1..6).hour

  e.content = row[2]

  e.save!
end
