class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :type
      t.string :repo_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
