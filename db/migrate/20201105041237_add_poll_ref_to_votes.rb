class AddPollRefToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :poll, null: false, foreign_key: true
  end
end
