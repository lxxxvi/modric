class SaveTeam < Team::SaveOperation
  permit_columns trigram
end
