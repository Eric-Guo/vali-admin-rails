# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: Rails.application.credentials.sendgrid_apikey,
  domain: 'cloud-mes.com',
  address: 'smtp.sendgrid.net',
  port: 465,
  enable_starttls_auto: true
}
