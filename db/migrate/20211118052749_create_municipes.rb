class CreateMunicipes < ActiveRecord::Migration[6.1]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.bigint :cpf
      t.bigint :cns
      t.string :email
      t.date :birth_date
      t.bigint :phone
      t.string :photo
      t.boolean :status

      t.timestamps
    end
  end
end
