class CreateTeams::V20200805135833 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Team) do
      primary_key id : Int64
      add trigram : String, index: true, unique: true

      add_timestamps
    end
  end

  def rollback
    drop table_for(Team)
  end
end
