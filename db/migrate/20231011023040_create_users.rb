class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.text :bio
      t.timestamps
    end
  end
end
