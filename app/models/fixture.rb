class Fixture < ApplicationRecord
  has_and_belongs_to_many :teams

  def is_regular_season
    self.round.to_i > 0
  end
end
