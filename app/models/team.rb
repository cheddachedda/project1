class Team < ApplicationRecord
  has_and_belongs_to_many :fixtures

  def home_fixtures
    self.fixtures.where({ home: self.name }).filter{ |f| f.status != 'BYE' && f.is_regular_season }
  end

  def home_wins
    home_fixtures.filter{ |f| f.home_score > f.away_score }.count
  end

  def home_draws
    home_fixtures.filter{ |f| f.home_score == f.away_score }.count
  end

  def home_losses
    home_fixtures.filter{ |f| f.home_score < f.away_score }.count
  end

  def home_goals_for
    home_fixtures.map{ |f| f.home_score }.sum
  end

  def home_goals_against
    home_fixtures.map{ |f| f.away_score }.sum
  end

  def away_fixtures
    self.fixtures.where({ away: self.name }).filter{ |f| f.status != 'BYE' && f.is_regular_season }
  end

  def away_wins
    away_fixtures.filter{ |f| f.away_score > f.home_score }.count
  end

  def away_draws
    away_fixtures.filter{ |f| f.away_score == f.home_score }.count
  end

  def away_losses
    away_fixtures.filter{ |f| f.away_score < f.home_score }.count
  end

  def away_goals_for
    away_fixtures.map{ |f| f.away_score }.sum
  end

  def away_goals_against
    away_fixtures.map{ |f| f.home_score }.sum
  end

  def byes
    self.fixtures.where({ status: 'BYE', home: self.name })
  end

  def games_played
    self.home_fixtures.count + self.away_fixtures.count
  end

  def wins
    self.home_wins + self.away_wins
  end

  def draws
    self.home_draws + self.away_draws
  end

  def losses
    self.home_losses + self.away_losses
  end

  def record
    "#{ self.wins }-#{ self.losses }#{ "-#{self.draws}" if self.draws > 0 }"
  end

  def goals_for
    self.home_goals_for + self.away_goals_for
  end

  def goals_against
    self.home_goals_against + self.away_goals_against
  end

  def goal_percentage
    ((self.goals_for / self.goals_against.to_f) * 100).round 1
  end

  def win_percentage
    ((self.wins + self.draws/2.0) / self.games_played * 100).round 1
  end

  def rank
    # TODO: figure out how to import TeamsHelper...sort_for_ladder
    ladder = Team.all.sort_by{|t| [ t.win_percentage, t.goal_percentage, t.goals_for ]}.reverse
    ladder.index(self) + 1
  end

  def result fixture
    if fixture.win? self
      'W'
    elsif fixture.loss? self
      'L'
    elsif fixture.draw?
      'D'
    end
  end

  def results
    self.fixtures.map{ |f| self.result f }
  end
end
