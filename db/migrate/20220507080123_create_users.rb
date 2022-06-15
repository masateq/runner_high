class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.string  :crypted_password
      t.string  :salt
      t.integer :age
      t.integer :sex, default: 0, null: false
      t.float   :weight
      t.integer :running_hour, default: 0, null: false
      t.integer :running_minute, default: 30, null: false
      t.integer :running_second, default: 0, null: false
      t.float   :running_distance, default: 5.0, null: false

      t.timestamps
    end
  end
end
