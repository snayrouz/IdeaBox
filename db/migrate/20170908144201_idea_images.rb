class IdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_images do |t|
      t.integer :idea_id
      t.integer :image_id

      t.timestamps
    end
  end
end
