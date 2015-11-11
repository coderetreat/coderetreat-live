class UpdateCoderetreatDateToTimestamp < ActiveRecord::Migration
  def up
    change_column :coderetreats, :date, :datetime
  end

  def down
    change_column :coderetreats, :date, :date
  end
end
