class CreateAudits < ActiveRecord::Migration[6.0]
  def change
    create_table :audits do |t|
      t.string :notification
      t.text :jsonb
      #add_column :audits, :data, :jsonb, default: {}
      #add_index :audits, :data, using: :gin
      t.references :auditable, polymorphic: true, null: false
    end
  end
end
