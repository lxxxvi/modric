class Api::Matches::Index < ApiAction
  get "/api/matches" do
    matches = MatchQuery.new.preload_home_team.preload_guest_team.preload_venue
    json MatchSerializer.for_collection(matches)
  end
end
