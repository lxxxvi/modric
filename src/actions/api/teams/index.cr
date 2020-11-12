class Api::Teams::Index < ApiAction
  get "/api/teams" do
    teams = TeamQuery.new
    json TeamSerializer.for_collection(teams)
  end
end
