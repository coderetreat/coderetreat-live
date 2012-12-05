class CreateCoderetreatSessions < ActiveRecord::Migration
  def change
    create_table :coderetreat_sessions do |t|
      t.text :constraints, default: ""

      t.timestamps
    end
  end
end
