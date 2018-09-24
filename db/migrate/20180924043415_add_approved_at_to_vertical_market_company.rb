class AddApprovedAtToVerticalMarketCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :vertical_market_companies, :approved_at, :date
  end
end
