module ApplicationHelper
  def devise_error_messages
    return '' unless defined?(resource) && resource.errors.present?

    messages = resource.errors.full_messages.join('，')
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    "#{sentence}#{messages}"
  end

  def current_course_users(course, current_user)
    if current_user&.super_admin?
      course.users
    else
      course.users.where(id: policy_scope(User).pluck(:id))
    end
  end
end
