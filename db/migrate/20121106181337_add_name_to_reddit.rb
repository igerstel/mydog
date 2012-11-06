class AddNameToReddit < ActiveRecord::Migration
  def change
  	add_column :reddits, :name, :string
  end
end
