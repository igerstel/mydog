class AddFoundAndCommentedAndImgToReddit < ActiveRecord::Migration
  def change
  	add_column :reddits, :found, :boolean, :default => :false
  	add_column :reddits, :commented, :boolean, :default => :false
  	add_column :reddits, :img, :string
  end
end
