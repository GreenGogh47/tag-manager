class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.references :space, foreign_key: true
      t.string :name
      t.string :c_id
      t.integer :orderindex
      t.string :color

      t.timestamps
    end
  end
end
