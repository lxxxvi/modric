class CreateMatches::V20200805154542 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Match) do
      primary_key id : Int64

      add_belongs_to home_team : Team?, on_delete: :cascade
      add_belongs_to guest_team : Team?, on_delete: :cascade
      add_belongs_to venue : Venue, on_delete: :cascade

      add uefa_match_id : String
      add home_team_score : Int16?
      add guest_team_score : Int16?
      add tournament_stage : Int32
      add kickoff_at : Time

      add_timestamps
    end
  end

  def rollback
    drop table_for(Match)
  end
end
