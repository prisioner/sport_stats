class PlayersController < ApplicationController
  before_action :load_player, only: %i[show complete_mark check_mark_completion]

  def index
    players = Player.all

    render json: players
  end

  def show
    render json: @player
  end

  def complete_mark
    achievement = @player.achievements.find_or_create_by(mark_id: params[:mark_id], game_id: params[:game_id])

    respond_with(achievement)
  end

  def check_mark_completion
    render json: MarkCompletionChecker.call(@player, params[:mark_id])
  end

  private

  def load_player
    @player = Player.find(params[:id])
  end
end
