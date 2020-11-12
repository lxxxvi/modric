class MatchSerializer < BaseSerializer
  def initialize(@match : Match)
  end

  def render
    {
      uefaMatchId:     @match.uefa_match_id,
      homeTeam:        TeamSerializer.new(@match.home_team),
      guestTeam:       TeamSerializer.new(@match.guest_team),
      tournamentStage: @match.tournament_stage,
      kickoffAt:       @match.kickoff_at,
      venue:           VenueSerializer.new(@match.venue),
    }
  end
end
