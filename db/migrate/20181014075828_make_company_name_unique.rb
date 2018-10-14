class MakeCompanyNameUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :companies, :name, unique: true
  end
end
