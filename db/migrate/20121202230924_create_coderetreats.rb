class CreateCoderetreats < ActiveRecord::Migration
  def change
    create_table :coderetreats do |t|
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
