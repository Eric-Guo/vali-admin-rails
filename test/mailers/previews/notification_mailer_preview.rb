# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def new_company_email
    company = Company.find_by(name: '上投摩根基金管理有限公司')
    NotificationMailer.with(vertical_market_company: company.vertical_market_companies.first).new_company_email
  end
end
