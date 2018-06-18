class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :province
      t.string :address

      t.timestamps null: false
    end

    create_table :company_users do |t|
      t.references :company
      t.references :user

      t.timestamps null: false
    end
  end
end
