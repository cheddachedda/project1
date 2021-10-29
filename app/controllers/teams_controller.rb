class TeamsController < ApplicationController
  def index
    @teams = Team.all.sort_by{|t| [ t.win_percentage, t.goal_percentage ]}.reverse
  end

  def new
  end

  def create
  end

  def show
    @team = Team.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
