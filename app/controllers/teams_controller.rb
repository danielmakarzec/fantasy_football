class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    respond_to do |format|
      if @team.save!
        format.js
        format.html { redirect_to @team }
      else
        format.html { render 'new' }
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :formation, :budget, :points)
  end
end