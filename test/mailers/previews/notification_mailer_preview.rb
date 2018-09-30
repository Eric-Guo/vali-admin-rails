# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def new_company_email
    company = Company.find_by(name: '上投摩根基金管理有限公司')
    NotificationMailer.with(vertical_market_company: company.vertical_market_companies.first).new_company_email
  end

  def new_circular_email
    circular = Circular.find_by(title: '2019年度Rails技术认证培训会')
    NotificationMailer.with(vertical_market_circular: circular.vertical_market_circulars.first).new_circular_email
  end
end
