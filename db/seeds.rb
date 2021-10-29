Team.destroy_all
Team.create :name => 'Netball Regretball'
puts "#{ Team.count } #{ 'team'.pluralize Team.count } created"
