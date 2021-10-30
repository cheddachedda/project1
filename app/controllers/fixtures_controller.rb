class FixturesController < ApplicationController
  def index
    @fixtures = Fixture.all
  end

  def new
  end

  def create
  end

  def round
    @fixtures = Fixture.where(round: params[:round])
  end

  def show
    @fixture = Fixture.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
