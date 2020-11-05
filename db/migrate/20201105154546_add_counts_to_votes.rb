class AddCountsToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :counts, :bigint, null: false
  end
end
