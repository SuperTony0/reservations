class AddOwnerToRoom < ActiveRecord::Migration
  def change
    add_reference :rooms, :owner, references: :user, index: true
    add_foreign_key :rooms, :users, column: :owner_id
  end
end
