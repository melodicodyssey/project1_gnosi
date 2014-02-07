class RenameRememberMeTokenInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :remember_me_token, :remember_token
  end
end
