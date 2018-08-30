class AddApprovedAtToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :approved_at, :date, default: nil
  end
end
