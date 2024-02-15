class CreateSpaceMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :space_members do |t|
      t.references :space, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
