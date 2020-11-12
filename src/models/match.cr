class Match < BaseModel
  avram_enum TournamentStage do
    GroupMatch1
    GroupMatch2
    GroupMatch3
    RoundOf16
    QuarterFinals
    SemiFinals
    Final
  end

  table do
    column uefa_match_id : String
    belongs_to home_team : Team?
    belongs_to guest_team : Team?
    column home_team_score : Int16?
    column guest_team_score : Int16?
    column tournament_stage : Match::TournamentStage
    column kickoff_at : Time
    belongs_to venue : Venue
  end
end
