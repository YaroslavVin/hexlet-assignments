class AddNameToTask < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :string
  end
end
