class ChangeParamNullInFieldsToAdresses < ActiveRecord::Migration[6.1]
  def change
    change_table :adresses do |t|
      t.change :cep, :bigint, :null => false
      t.change :logradouro, :string, :null => false
      t.change :complement, :string, :null => false
      t.change :district, :string, :null => false
      t.change :city, :string, :null => false
      t.change :uf, :string, :null => false
      t.change :ibge_code, :bigint, :null => true
    end
  end
end
