class CreateCoderetreats < ActiveRecord::Migration
  def change
    create_table :coderetreats do |t|
      t.date :scheduled_for
      t.string :state
      t.string :location
      t.string :admin_token

      t.timestamps
    end
  end
end
