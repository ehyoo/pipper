class AddNicknameAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :description, :text
  end
end
