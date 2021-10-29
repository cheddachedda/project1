class CreateFixturesTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures_teams, :id => false do |t|
      t.integer :fixture_id
      t.integer :team_id

      t.timestamps
    end
  end
end
