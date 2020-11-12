class Db::InsertMatches < LuckyCli::Task
  summary "Inserts matches"

  def call
    puts "\n= Inserting matches ="
    rows.each do |row|
      uefa_match_id, home_team_trigram, guest_team_trigram, tournament_stage, kickoff_at, venue_city = row

      puts "  * #{home_team_trigram} vs #{guest_team_trigram} (#{tournament_stage}, #{venue_city})"
      home_team = TeamQuery.new.trigram(home_team_trigram).first?
      guest_team = TeamQuery.new.trigram(guest_team_trigram).first?
      venue = VenueQuery.new.city(venue_city).first

      match = MatchQuery.new.uefa_match_id(uefa_match_id).first?
      if match.nil?
        SaveMatch.create!(
          uefa_match_id: uefa_match_id,
          home_team_id: home_team.try &.id,
          guest_team_id: guest_team.try &.id,
          tournament_stage: Match::TournamentStage.new(Match::AvramTournamentStage.parse(tournament_stage.to_s)),
          kickoff_at: Time.parse!(kickoff_at, "%Y-%m-%dT%H:%M:%S%z"),
          venue_id: venue.id
        )
      end
    end
  end

  private def rows
    [
      {"1", "TUR", "ITA", :GroupMatch1, "2021-06-11T19:00:00+00:00", "Rome"},
      {"2", "WAL", "SUI", :GroupMatch1, "2021-06-12T13:00:00+00:00", "Baku"},
      {"3", "DEN", "FIN", :GroupMatch1, "2021-06-12T16:00:00+00:00", "Copenhagen"},
      {"4", "BEL", "RUS", :GroupMatch1, "2021-06-12T19:00:00+00:00", "Saint Petersburg"},
      {"6", "AUT", "N/A", :GroupMatch1, "2021-06-13T16:00:00+00:00", "Bucharest"},
      {"5", "NED", "UKR", :GroupMatch1, "2021-06-13T19:00:00+00:00", "Amsterdam"},
      {"7", "ENG", "CRO", :GroupMatch1, "2021-06-13T13:00:00+00:00", "London"},
      {"8", "N/A", "CZE", :GroupMatch1, "2021-06-14T13:00:00+00:00", "Glasgow"},
      {"9", "ESP", "SWE", :GroupMatch1, "2021-06-14T19:00:00+00:00", "Bilbao"},
      {"10", "POL", "N/A", :GroupMatch1, "2021-06-14T16:00:00+00:00", "Dublin"},
      {"11", "N/A", "POR", :GroupMatch1, "2021-06-15T16:00:00+00:00", "Budapest"},
      {"12", "FRA", "GER", :GroupMatch1, "2021-06-15T19:00:00+00:00", "Munich"},
      {"13", "TUR", "WAL", :GroupMatch2, "2021-06-16T16:00:00+00:00", "Baku"},
      {"14", "ITA", "SUI", :GroupMatch2, "2021-06-16T19:00:00+00:00", "Rome"},
      {"15", "FIN", "RUS", :GroupMatch2, "2021-06-16T13:00:00+00:00", "Saint Petersburg"},
      {"16", "DEN", "BEL", :GroupMatch2, "2021-06-17T16:00:00+00:00", "Copenhagen"},
      {"18", "UKR", "N/A", :GroupMatch2, "2021-06-17T13:00:00+00:00", "Bucharest"},
      {"17", "NED", "AUT", :GroupMatch2, "2021-06-17T19:00:00+00:00", "Amsterdam"},
      {"19", "CRO", "CZE", :GroupMatch2, "2021-06-18T16:00:00+00:00", "Glasgow"},
      {"20", "ENG", "N/A", :GroupMatch2, "2021-06-18T19:00:00+00:00", "London"},
      {"21", "SWE", "N/A", :GroupMatch2, "2021-06-18T13:00:00+00:00", "Dublin"},
      {"22", "ESP", "POL", :GroupMatch2, "2021-06-19T19:00:00+00:00", "Bilbao"},
      {"23", "N/A", "FRA", :GroupMatch2, "2021-06-19T13:00:00+00:00", "Budapest"},
      {"24", "POR", "GER", :GroupMatch2, "2021-06-19T16:00:00+00:00", "Munich"},
      {"25", "SUI", "TUR", :GroupMatch3, "2021-06-20T16:00:00+00:00", "Baku"},
      {"26", "ITA", "WAL", :GroupMatch3, "2021-06-20T16:00:00+00:00", "Rome"},
      {"27", "RUS", "DEN", :GroupMatch3, "2021-06-21T19:00:00+00:00", "Copenhagen"},
      {"28", "FIN", "BEL", :GroupMatch3, "2021-06-21T19:00:00+00:00", "Saint Petersburg"},
      {"29", "N/A", "NED", :GroupMatch3, "2021-06-21T16:00:00+00:00", "Amsterdam"},
      {"30", "UKR", "AUT", :GroupMatch3, "2021-06-21T16:00:00+00:00", "Bucharest"},
      {"31", "CRO", "N/A", :GroupMatch3, "2021-06-22T19:00:00+00:00", "Glasgow"},
      {"32", "CZE", "ENG", :GroupMatch3, "2021-06-22T19:00:00+00:00", "London"},
      {"33", "N/A", "ESP", :GroupMatch3, "2021-06-23T16:00:00+00:00", "Bilbao"},
      {"34", "SWE", "POL", :GroupMatch3, "2021-06-23T16:00:00+00:00", "Dublin"},
      {"35", "POR", "FRA", :GroupMatch3, "2021-06-23T19:00:00+00:00", "Budapest"},
      {"36", "GER", "N/A", :GroupMatch3, "2021-06-23T19:00:00+00:00", "Munich"},
      {"38", "N/A", "N/A", :RoundOf16, "2021-06-26T16:00:00+00:00", "Amsterdam"},
      {"37", "N/A", "N/A", :RoundOf16, "2021-06-26T19:00:00+00:00", "London"},
      {"40", "N/A", "N/A", :RoundOf16, "2021-06-27T16:00:00+00:00", "Budapest"},
      {"39", "N/A", "N/A", :RoundOf16, "2021-06-27T19:00:00+00:00", "Bilbao"},
      {"42", "N/A", "N/A", :RoundOf16, "2021-06-28T16:00:00+00:00", "Copenhagen"},
      {"41", "N/A", "N/A", :RoundOf16, "2021-06-28T19:00:00+00:00", "Bucharest"},
      {"44", "N/A", "N/A", :RoundOf16, "2021-06-29T16:00:00+00:00", "Dublin"},
      {"43", "N/A", "N/A", :RoundOf16, "2021-06-29T19:00:00+00:00", "Glasgow"},
      {"45", "N/A", "N/A", :QuarterFinals, "2021-07-02T16:00:00+00:00", "Saint Petersburg"},
      {"46", "N/A", "N/A", :QuarterFinals, "2021-07-02T19:00:00+00:00", "Munich"},
      {"47", "N/A", "N/A", :QuarterFinals, "2021-07-03T16:00:00+00:00", "Baku"},
      {"48", "N/A", "N/A", :QuarterFinals, "2021-07-03T19:00:00+00:00", "Rome"},
      {"49", "N/A", "N/A", :SemiFinals, "2021-07-06T19:00:00+00:00", "London"},
      {"50", "N/A", "N/A", :SemiFinals, "2021-07-07T19:00:00+00:00", "London"},
      {"51", "N/A", "N/A", :Final, "2021-07-11T19:00:00+00:00", "London"},
    ]
  end
end
