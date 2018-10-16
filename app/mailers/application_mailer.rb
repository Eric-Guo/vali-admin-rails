class ApplicationMailer < ActionMailer::Base
  default from: 'harman_training@training.harmanpro.com.cn', bcc: 'johnson.yang@harman.com'
  layout 'mailer'
end
