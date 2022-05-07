class CreateTrainingSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :training_suggestions do |t|
      t.float       :distance
      t.integer     :intensity
      t.float       :vdot
      t.integer     :pace
      t.references  :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
