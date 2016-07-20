class AddIdentityDetails < ActiveRecord::Migration
  def change
    add_column :identities, :name, :string
    add_column :identities, :email, :string
    add_column :identities, :image, :string

  end
end
