class CreateFbooks < ActiveRecord::Migration
  def change
    create_table :fbooks do |t|
      t.string :url
      t.string :access

      t.timestamps
    end
  end
end
