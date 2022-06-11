class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :dni
      t.string :rol_id

      t.timestamps
    end
  end
end
