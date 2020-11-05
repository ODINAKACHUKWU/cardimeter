class AddColumnsToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :publish, :boolean, null: false, default: false
    add_column :polls, :published_at, :datetime
  end
end
