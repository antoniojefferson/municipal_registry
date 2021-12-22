class RenameAdressesTableNameToAddresses < ActiveRecord::Migration[6.1]
  def up
    rename_table :adresses, :addresses
  end
  
  def down
    rename_table :addresses, :adresses
  end
end
