class NotificationMailer < ApplicationMailer
  def new_company_email
    @vertical_market_company = params[:vertical_market_company]
    @company_name = @vertical_market_company.company.name
    mail(to: @vertical_market_company.vertical_market.admin.email, subject: "新的公司注册了：#{@company_name}")
  end

  def new_circular_email
    vertical_market_circular = params[:vertical_market_circular]
    @circular = vertical_market_circular.circular
    vertical_market = vertical_market_circular.vertical_market
    to_emails = vertical_market.companies.where(rank: 1).where.not(approved_at: nil).collect do |company|
      company.users.where(locked_at: nil).where.not(email: nil).pluck(:email)
    end << vertical_market.admin.email

    mail(to: to_emails, subject: "新通知：#{@circular.title}")
  end
end
