class ChangeParamNullInFieldsToMunicipes < ActiveRecord::Migration[6.1]
  def change
    change_table :municipes do |t|
      t.change :full_name, :string, :null => false
      t.change :cpf, :string, :null => false
      t.change :cns, :string, :null => false
      t.change :email, :string, :null => false
      t.change :birth_date, :date, :null => false
      t.change :phone, :bigint, :null => false
      t.change :status, :boolean, :null => false
    end
  end
end
