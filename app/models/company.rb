class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users
  has_many :vertical_market_companies
  has_many :vertical_markets, through: :vertical_market_companies
end
