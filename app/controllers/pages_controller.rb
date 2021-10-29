class PagesController < ApplicationController
  def home
    @models = helpers.get_all_models
  end
end
