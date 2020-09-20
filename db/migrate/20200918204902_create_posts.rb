class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :message
      t.string :fb_id
      t.string :updated_time
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
