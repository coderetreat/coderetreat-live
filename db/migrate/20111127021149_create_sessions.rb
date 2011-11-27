class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :session_number
      t.references :coderetreat

      t.timestamps
    end
  end
end
