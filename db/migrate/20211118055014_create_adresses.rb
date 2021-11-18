class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.bigint :cep
      t.string :logradouro
      t.string :complement
      t.string :district
      t.string :city
      t.string :uf
      t.bigint :ibge_code
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
