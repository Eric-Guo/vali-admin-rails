class VerticalMarket < ApplicationRecord
  has_many :vertical_market_companies
  has_many :companies, through: :vertical_market_companies
end
