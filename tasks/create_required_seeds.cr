require "../spec/support/boxes/**"

class Db::CreateRequiredSeeds < LuckyCli::Task
  summary "Add database records required for the app to work"

  def call
    Db::InsertTeams.new.call
    Db::InsertVenues.new.call
    Db::InsertMatches.new.call
    puts "Done adding required data"
  end
end
