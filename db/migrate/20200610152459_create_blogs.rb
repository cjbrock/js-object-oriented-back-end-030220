class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.string :content
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
