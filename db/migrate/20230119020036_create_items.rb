class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null:false
      t.string :name, null:false
      t.string :explation, null:false
      t.integer :price, null:false
      t.boolean :sale_status, null:false, default: 0
      t.timestamps
    end
  end
end
