class Venue < BaseModel
  table do
    column name : String
    column city : String
    column country_time_zone_identifier : String
  end
end
