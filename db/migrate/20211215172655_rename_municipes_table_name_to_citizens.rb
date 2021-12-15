class RenameMunicipesTableNameToCitizens < ActiveRecord::Migration[6.1]
  def change
    rename_table :municipes, :citizens
  end
end
