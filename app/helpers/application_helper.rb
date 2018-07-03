module ApplicationHelper
  def devise_error_messages
    return '' unless defined?(resource) && resource.errors.present?

    messages = resource.errors.full_messages.join('，')
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    "#{sentence}#{messages}"
  end

  def display_system_role(user)
    return unless user.present?
    vm = VerticalMarket.find_by admin: user
    if vm.present?
      content_tag :p, "#{vm.name}管理员", class: 'app-sidebar__user-designation'
    end
  end
end
