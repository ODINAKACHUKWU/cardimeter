class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.bigint :units
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
