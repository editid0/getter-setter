class CreateCodeItems < ActiveRecord::Migration[8.0]
  def change
    create_table :code_items do |t|
      t.string :name
      t.text :value
      t.string :access_token
      t.string :delete_token
      t.boolean :require_access_read
      t.boolean :require_access_write

      t.timestamps
    end
  end
end
