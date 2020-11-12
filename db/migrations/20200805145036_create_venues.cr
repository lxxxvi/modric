class CreateVenues::V20200805145036 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Venue) do
      primary_key id : Int64
      add name : String
      add city : String, index: true, unique: true
      add country_time_zone_identifier : String
      add_timestamps
    end
  end

  def rollback
    drop table_for(Venue)
  end
end
