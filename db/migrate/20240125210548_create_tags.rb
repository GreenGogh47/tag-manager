class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :tag_fg
      t.string :tag_bg
      t.integer :creator
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
