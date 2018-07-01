class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :vertical_markets do |t|
      t.string :name
      t.references :admin

      t.timestamps null: false
    end

    create_table :vertical_market_companies do |t|
      t.references :vertical_market
      t.references :company

      t.timestamps null: false
    end

    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :district
      t.string :address

      t.timestamps null: false
    end

    create_table :company_users do |t|
      t.references :company
      t.references :user

      t.timestamps null: false
    end

    add_column :users, :name, :string
    add_column :users, :title, :string
    add_column :users, :phone, :string
  end
end
