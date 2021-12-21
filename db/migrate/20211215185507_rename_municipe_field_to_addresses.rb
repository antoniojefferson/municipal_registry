class RenameMunicipeFieldToAddresses < ActiveRecord::Migration[6.1]
  def up
    rename_column :addresses, :municipe_id, :citizen_id
  end

  def down
    rename_column :addresses, :citizen_id, :municipe_id
  end
end
