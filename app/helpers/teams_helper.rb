module TeamsHelper
  def sort_for_ladder
    Team.all.sort_by{|t| [ t.win_percentage, t.goal_percentage, t.goals_for ]}.reverse
  end
end
