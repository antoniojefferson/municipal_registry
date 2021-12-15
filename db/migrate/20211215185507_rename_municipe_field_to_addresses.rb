class RenameMunicipeFieldToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :municipe_id, :citizen_id
  end
end
