class VerticalMarketCircular < ApplicationRecord
  belongs_to :vertical_market
  belongs_to :circular

  after_create :send_new_circular_email

  def send_new_circular_email
    NotificationMailer.with(vertical_market_circular: self).new_circular_email.deliver_later
  end
end
