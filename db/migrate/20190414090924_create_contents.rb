class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :title
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :contents, [:user_id, :created_at]
  end
end
