class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_number, null: false
      t.jsonb :data

      t.timestamps
    end
    add_index :companies, :company_number, unique: true
  end
end
