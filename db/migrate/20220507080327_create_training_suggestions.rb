class CreateTrainingSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :training_suggestions do |t|
      t.float       :running_distance
      t.integer     :intensity

      t.references  :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
