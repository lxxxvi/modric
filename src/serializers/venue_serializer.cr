class VenueSerializer < BaseSerializer
  def initialize(@venue : Venue)
  end

  def render
    {
      name:                         @venue.name,
      city:                         @venue.city,
      country_time_zone_identifier: @venue.country_time_zone_identifier,
    }
  end
end
