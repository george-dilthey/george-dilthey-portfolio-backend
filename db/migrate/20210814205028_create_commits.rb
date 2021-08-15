class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.string :message
      t.datetime :timestamp
      t.integer :stats
      t.string :url
      t.string :sha
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
