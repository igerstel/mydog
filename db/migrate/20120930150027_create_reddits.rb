class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.string :url

      t.timestamps
    end
  end
end
