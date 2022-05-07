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
      t.integer :target_hour
      t.integer :target_minute
      t.integer :target_second
      t.float :target_distance

      t.timestamps
    end
  end
end
