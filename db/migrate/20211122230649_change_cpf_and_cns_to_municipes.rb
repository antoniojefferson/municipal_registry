class ChangeCpfAndCnsToMunicipes < ActiveRecord::Migration[6.1]
  def change
    change_table :municipes do |t|
      t.change :cpf, :string
      t.change :cns, :string
    end
  end
end
