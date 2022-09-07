class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image_url
      t.integer :likes, default:0
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end