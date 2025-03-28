class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :summary
      t.boolean :published

      t.timestamps
    end
  end
end
