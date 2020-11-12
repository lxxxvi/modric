class Db::InsertTeams < LuckyCli::Task
  summary "Inserts teams"

  def call
    puts "\n= Inserting teams ="

    rows.each do |trigram|
      puts "  * #{trigram}"
      unless TeamQuery.new.trigram(trigram).first?
        SaveTeam.create!(trigram: trigram)
      end
    end
  end

  private def rows
    %w[
      ITA SUI TUR WAL
      BEL DEN FIN RUS
      AUT NED UKR
      ENG CRO CZE
      POL ESP SWE
      FRA GER POR
    ]
  end
end
