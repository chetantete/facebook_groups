class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.text :keyword
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
