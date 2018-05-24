class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :user_to
      t.integer :user_from
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
