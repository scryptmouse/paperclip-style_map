ActiveRecord::Schema.define do
  self.verbose = false

  create_table :things, force: true do |t|
    t.string :asset_file_name
    t.integer :asset_file_size
    t.string :asset_content_type
    t.timestamp :asset_updated_at
    t.boolean :asset_processing, null: false, default: false

    t.timestamps null: false
  end
end
