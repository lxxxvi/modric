class TeamSerializer < BaseSerializer
  def initialize(@team : Team | Nil)
  end

  def render
    if @team.nil?
      {} of Nil => Nil
    else
      {
        trigram: @team.try &.trigram,
      }
    end
  end
end
