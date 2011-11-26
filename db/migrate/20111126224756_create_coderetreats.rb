class CreateCoderetreats < ActiveRecord::Migration
  def change
    create_table :coderetreats do |t|
      t.date :scheduled_for
      t.string :state

      t.timestamps
    end
  end
end
