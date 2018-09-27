class VerticalMarketCompany < ApplicationRecord
  belongs_to :vertical_market
  belongs_to :company

  after_create :send_new_company_email

  def send_new_company_email
    NotificationMailer.with(vertical_market_company: self).new_company_email.deliver_later
  end
end
