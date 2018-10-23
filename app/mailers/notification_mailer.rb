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

    mail(to: (emails_belongs_to_vm(vertical_market) << vertical_market.admin.email),
         subject: "新通知：#{@circular.title}")
  end

  def new_course_email
    vertical_market_course = params[:vertical_market_course]
    @course = vertical_market_course.course
    vertical_market = vertical_market_course.vertical_market

    mail(to: (emails_belongs_to_vm(vertical_market) << vertical_market.admin.email),
         subject: "新培训：#{@course.title}")
  end

  private

  def emails_belongs_to_vm(vertical_market)
    vertical_market.companies.where(rank: 1).where.not(approved_at: nil).collect do |company|
      company.users.where(locked_at: nil).where.not(email: nil).pluck(:email)
    end
  end
end
