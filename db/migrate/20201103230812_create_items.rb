class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.references :poll, index: true, foreign_key: true

      t.timestamps
    end
  end
end
