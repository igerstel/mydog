class AddUploadedToFbooks < ActiveRecord::Migration
  def change
  	add_column :fbooks, :inimgur, :boolean, :default => 0
  end
end
