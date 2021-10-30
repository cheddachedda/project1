class TeamsController < ApplicationController
  def index
    @teams = helpers.sort_for_ladder
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
