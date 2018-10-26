class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users
  has_many :vertical_markets, through: :companies
  has_one :admined_vm, class_name: :VerticalMarket, foreign_key: :admin_id
  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users

  attr_accessor(*CompanyRegistration::COMPANY_REG_FIELDS)
  attr_accessor :create_user_via_company_id

  def gravatarurl
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def super_admin?
    email == 'johnson.yang@harman.com'
  end

  def internal_user?
    super_admin? || admined_vm.present?
  end

  def first_level_vendor?
    companies&.pluck(:rank)&.min == 1
  end
end
