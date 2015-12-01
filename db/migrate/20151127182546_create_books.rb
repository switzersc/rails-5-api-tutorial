class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page_count
      t.text :description

      t.timestamps
    end
  end
end
