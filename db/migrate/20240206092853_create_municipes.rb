class CreateMunicipes < ActiveRecord::Migration[7.1]
  def change
    create_table :municipes do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.string :birthdate, null: false
      t.string :phone, null: false
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :municipes, :email, unique: true
    add_index :municipes, :cpf, unique: true
    add_index :municipes, :cns, unique: true
  end
end
