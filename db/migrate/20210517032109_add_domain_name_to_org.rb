class AddDomainNameToOrg < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :domain_name, :string
  end
end
