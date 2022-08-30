class AddColumnsToTraingSuggestions < ActiveRecord::Migration[6.1]
  def change
    add_column :training_suggestions, :temperature, :integer
    add_column :training_suggestions, :height, :integer
  end
end
