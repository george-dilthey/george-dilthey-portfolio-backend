class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.string :message
      t.datetime :timestamp
      t.integer :changes
      t.string :url
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
