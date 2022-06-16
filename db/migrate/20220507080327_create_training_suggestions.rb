class CreateTrainingSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :training_suggestions do |t|
      t.float       :running_distance
      t.integer     :intensity
      t.integer     :adjust_intensity, default: 0
      t.integer     :times, default: 1, null: false
      t.references  :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
