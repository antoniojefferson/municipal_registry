class RenameMunicipesTableNameToCitizens < ActiveRecord::Migration[6.1]
  def up
    rename_table :municipes, :citizens
  end
  
  def down
    rename_table :citizens, :municipes
  end
end
