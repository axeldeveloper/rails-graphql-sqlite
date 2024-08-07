class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.string :description
      t.integer :publication_date
      t.string :genre

      t.timestamps
    end
  end
end
