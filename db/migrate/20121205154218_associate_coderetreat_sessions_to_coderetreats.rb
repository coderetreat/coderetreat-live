class AssociateCoderetreatSessionsToCoderetreats < ActiveRecord::Migration
  def change
    change_table :coderetreat_sessions do |t|
      t.references :coderetreat
    end
  end
end
