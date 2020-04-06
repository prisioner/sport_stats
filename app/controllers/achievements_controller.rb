class AchievementsController < ApplicationController
  def index
    achievements = Achievement.all

    render json: achievements
  end

  def show
    achievement = Achievement.find(params[:id])

    render json: achievement
  end
end
