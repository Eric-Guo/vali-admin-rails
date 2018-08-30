class Circular < ApplicationRecord
  has_many :vertical_market_circulars
  has_many :vertical_markets, through: :vertical_market_circulars
  validates_presence_of :title, :body
end
