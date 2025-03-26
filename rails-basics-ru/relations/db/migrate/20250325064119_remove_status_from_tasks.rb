class RemoveStatusFromTasks < ActiveRecord::Migration[7.2]
  def change
    remove_column :tasks, :status, :integer
  end
end
