class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users
end
