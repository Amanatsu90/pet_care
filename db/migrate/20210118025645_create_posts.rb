class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :title,        null: false
      t.text    :text,         null: false
      t.integer :dog_size_id,  null: false
      t.integer :theme_tag_id, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
