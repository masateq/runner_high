class CreateRunningRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :running_records do |t|
      t.date        :date
      t.integer     :running_hour
      t.integer     :running_minute
      t.integer     :running_second
      t.float       :running_distance
      t.float       :calorie
      t.float       :vdot
      t.integer     :intensity, default: 0, null: false
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
