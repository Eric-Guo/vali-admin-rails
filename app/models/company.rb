class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users
  has_many :vertical_market_companies
  has_many :vertical_markets, through: :vertical_market_companies
  belongs_to :managed_by_company, class_name: :Company, optional: true
  has_many :managed_companies, class_name: :Company, foreign_key: :managed_by_company_id
end
