class ChangeCommentsTypeInLinks < ActiveRecord::Migration
  def change
  	remove_column :links, :comments
  	add_column :links, :comments, :text
  end
end
