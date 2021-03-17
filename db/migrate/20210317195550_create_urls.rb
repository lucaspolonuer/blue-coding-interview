class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :large_url, null: false

      t.timestamps
    end
  end
end
