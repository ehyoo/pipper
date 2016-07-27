class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.timestamps null: false
      t.belongs_to :user
      t.integer :followee_id
    end
  end
end
