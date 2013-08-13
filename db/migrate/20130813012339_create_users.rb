class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :password, null: false
      t.string :about
      t.string :session_token
      t.timestamps
    end
  end
end
