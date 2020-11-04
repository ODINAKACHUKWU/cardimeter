class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false, default: ""
      t.boolean :status, null: false, default: true
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
  end
end
