class AddAdminTokenToCoderetreat < ActiveRecord::Migration
  def change
    add_column :coderetreats, :admin_token, :string
    add_index :coderetreats, :admin_token
  end
end
