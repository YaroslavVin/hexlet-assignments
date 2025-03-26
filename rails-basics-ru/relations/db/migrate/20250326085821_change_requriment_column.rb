class ChangeRequrimentColumn < ActiveRecord::Migration[7.2]
  def change
    change_column_null(:tasks, :status_id, true)
  end
end
