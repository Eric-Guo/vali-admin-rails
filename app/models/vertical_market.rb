class VerticalMarket < ApplicationRecord
  has_many :vertical_market_circulars
  has_many :circulars, through: :vertical_market_circulars

  has_many :vertical_market_companies
  has_many :companies, through: :vertical_market_companies
  has_many :users, through: :companies

  has_many :vertical_market_courses
  has_many :courses, through: :vertical_market_courses

  belongs_to :admin, class_name: :User, foreign_key: :admin_id
end
