class NotificationMailer < ApplicationMailer
  def new_company_email
    @vertical_market_company = params[:vertical_market_company]
    @company_name = @vertical_market_company.company.name
    mail(to: @vertical_market_company.vertical_market.admin.email, subject: "新的公司注册了：#{@company_name}")
  end
end
