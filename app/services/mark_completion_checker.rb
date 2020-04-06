class MarkCompletionChecker < ApplicationService
  def initialize(player, mark_id)
    @player = player
    @mark_id = mark_id
  end

  def call
    {
      mark_completed: Achievement.where(player: @player, mark_id: @mark_id, game_id: game_ids).any?
    }
  end

  private

  def game_ids
    @game_ids ||= @player.games.order(game_started_at: :desc).limit(5).pluck(:id)
  end
end
