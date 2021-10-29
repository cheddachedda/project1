class CreateFixtures < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures do |t|
      t.string :round
      t.string :date
      t.string :status
      t.string :venue
      t.string :home
      t.integer :home_score
      t.string :away
      t.integer :away_score

      t.timestamps
    end
  end
end
