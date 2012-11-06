class RemoveFoundFromReddit < ActiveRecord::Migration
  def change
  	remove_column :reddits, :found
  end
end
