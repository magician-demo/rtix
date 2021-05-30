class AddAddressToOrganization < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :facebook, :string
    add_column :organizations, :twitter, :string
    add_column :organizations, :flickr, :string
    add_column :organizations, :e_mail, :string
    add_column :organizations, :web, :string
  end
end
