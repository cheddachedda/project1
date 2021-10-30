class Fixture < ApplicationRecord
  has_and_belongs_to_many :teams

  def is_regular_season
    self.round.to_i > 0
  end

  def winner
    if self.home_score > self.away_score
      Team.find_by name: self.home
    elsif self.away_score > self.home_score
      Team.find_by name: self.away
    end
  end

  def loser
    if self.home_score < self.away_score
      Team.find_by name: self.home
    elsif self.away_score < self.home_score
      Team.find_by name: self.away
    end
  end

  def draw?
    self.home_score == self.away_score
  end
end
