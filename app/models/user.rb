class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :company_users
  has_many :companies, through: :company_users
  has_many :vertical_markets, through: :companies
  has_one :admined_vm, class_name: :VerticalMarket, foreign_key: :admin_id

  attr_accessor(*CompanyRegistration::COMPANY_REG_FIELDS)
  attr_accessor :create_user_via_company_id

  def gravatarurl
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def super_admin?
    email == 'rubygsy@icloud.com'
  end
end
