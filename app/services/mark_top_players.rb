class MarkTopPlayers < ApplicationService
  def initialize(mark, team_id)
    @mark = mark
    @team_id = team_id
  end

  def call
    players.group(:id).order('COUNT("players"."id") DESC').limit(5)
  end

  private

  def players
    @player ||=
      if @team_id
        @mark.players.where(team_id: @team_id)
      else
        @mark.players
      end
  end
end
