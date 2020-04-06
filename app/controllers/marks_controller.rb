class MarksController < ApplicationController
  before_action :load_mark, only: %i[show top]

  def index
    marks = Mark.all

    render json: marks
  end

  def show
    render json: @mark
  end

  def top
    players = MarkTopPlayers.call(@mark, params[:team_id])

    render json: players
  end

  private

  def load_mark
    @mark = Mark.find(params[:id])
  end
end
