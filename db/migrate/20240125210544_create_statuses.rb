class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :orderindex
      t.string :color
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
