class AddColumnsToPrescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :prescriptions, :user_id, :integer
    add_column :prescriptions, :treatment_id, :integer
  end
end
