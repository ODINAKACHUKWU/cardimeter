class AddShareToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :share, :boolean, null: false, default: false
    add_column :polls, :shared_at, :datetime
  end
end
