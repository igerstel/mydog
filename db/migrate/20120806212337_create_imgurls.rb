class CreateImgurls < ActiveRecord::Migration
  def change
    create_table :imgurls do |t|
      t.string :url

      t.timestamps
    end
  end
end
