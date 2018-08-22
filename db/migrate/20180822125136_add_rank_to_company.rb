class AddRankToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :rank, :integer, default: 2
  end
end
