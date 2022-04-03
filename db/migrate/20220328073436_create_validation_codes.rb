class CreateValidationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :validation_codes do |t|
      t.string :email
      t.integer :kind, defalut: 1, null: false
      t.datetime :used_at
      t.string :code

      t.timestamps
    end
  end
end
