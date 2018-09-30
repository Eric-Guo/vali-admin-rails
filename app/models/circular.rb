class Circular < ApplicationRecord
  has_many :vertical_market_circulars
  has_many :vertical_markets, through: :vertical_market_circulars
  validates_presence_of :title, :body, :vertical_market_circulars

  def vertical_market_ids
    @vertical_market_ids ||= vertical_markets.pluck(:id)
  end

  def vertical_market_ids=(values)
    select_values = values.reject(&:blank?).map(&:to_i)
    if new_record?
      (select_values - vertical_market_ids).each do |to_new_id|
        vertical_market_circulars.build(vertical_market_id: to_new_id)
      end
    else
      (vertical_market_ids - select_values).each do |to_destroy_id|
        vertical_market_circulars.find_by(vertical_market_id: to_destroy_id).destroy
      end
      (select_values - vertical_market_ids).each do |to_add_id|
        vertical_market_circulars.create(vertical_market_id: to_add_id)
      end
    end
  end
end
