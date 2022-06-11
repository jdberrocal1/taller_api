class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :state
      t.string :city
      t.string :address
      t.string :dni
      t.bigint :role_id

      t.timestamps
    end
  end
end
