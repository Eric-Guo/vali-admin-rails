class VendorsController < ApplicationController
  before_action :authenticate_user!
  def index
    admined_vm = VerticalMarket.find_by admin: current_user

    @vendor_list_description = if current_user.super_admin?
      '下表列出了所有代理商'
    elsif admined_vm.present?
      "下表列出了#{vm.name}代理商"
    else
      '请联系管理员获得访问此列表权限'
    end
  end
end
