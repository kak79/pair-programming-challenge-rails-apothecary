class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.integer :treatment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
