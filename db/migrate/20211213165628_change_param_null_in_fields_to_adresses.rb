class ChangeParamNullInFieldsToAdresses < ActiveRecord::Migration[6.1]
  def change
    change_table :adresses do |t|
      t.change :cep, :string, :null => false
      t.change :logradouro, :string, :null => false
      t.change :complement, :string, :null => false
      t.change :district, :string, :null => false
      t.change :city, :string, :null => false
      t.change :uf, :string, :null => false
    end
  end
end
