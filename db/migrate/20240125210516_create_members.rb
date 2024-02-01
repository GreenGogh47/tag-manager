class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :space, foreign_key: true
      t.string :username
      t.string :color
      t.string :profile_picture
      t.string :initials

      t.timestamps
    end
  end
end
