class Db::InsertVenues < LuckyCli::Task
  summary "Inserts venues"

  def call
    puts "\n= Inserting venues ="
    rows.each do |row|
      name, city, country_time_zone_identifier = row
      puts "  * #{name}, #{city} (#{country_time_zone_identifier})"
      unless VenueQuery.new.city(city).first?
        SaveVenue.create!(name: name, city: city, country_time_zone_identifier: country_time_zone_identifier)
      end
    end
  end

  private def rows
    [
      ["Wembley Stadium", "London", "Europe/London"],
      ["Allianz Arena", "Munich", "Europe/Berlin"],
      ["Stadio Olimpico", "Rome", "Europe/Rome"],
      ["Olympic Stadium", "Baku", "Asia/Baku"],
      ["Krestovsky Stadium", "Saint Petersburg", "Europe/Moscow"],
      ["Puskás Aréna", "Budapest", "Europe/Budapest"],
      ["Arena Națională", "Bucharest", "Europe/Bucharest"],
      ["Johan Cruyff Arena", "Amsterdam", "Europe/Amsterdam"],
      ["San Mamés", "Bilbao", "Europe/Madrid"],
      ["Hampden Park", "Glasgow", "Europe/London"],
      ["Aviva Stadium", "Dublin", "Europe/Dublin"],
      ["Parken Stadium", "Copenhagen", "Europe/Copenhagen"],
    ]
  end
end
