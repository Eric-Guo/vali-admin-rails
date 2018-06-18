class VerticalMarket < ApplicationRecord
  has_many :vertical_market_companies
  has_many :companies, through: :vertical_market_companies
  belongs_to :admin, class_name: :User, foreign_key: :admin_id
end
