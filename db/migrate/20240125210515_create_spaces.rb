class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :color
      t.boolean :hidden
      t.boolean :tags_enabled

      t.timestamps
    end
  end
end
