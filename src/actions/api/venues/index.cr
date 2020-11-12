class Api::Venues::Index < ApiAction
  get "/api/venues" do
    venues = VenueQuery.new
    json VenueSerializer.for_collection(venues)
  end
end
