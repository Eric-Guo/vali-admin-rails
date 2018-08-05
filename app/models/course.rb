class Course < ApplicationRecord
  has_many :course_users
  has_many :users, through: :course_users

  validates_presence_of :title, :address, :capacity, :start_time, :end_time
  scope :not_published, -> { where(published: false) }
  scope :available, -> { where(published: true).where('start_time > ?', Time.zone.now) }

  def attend_user_ids
    users.pluck(:id)
  end

  def attend_user_ids=(values)
    if new_record?
      (values - attend_user_ids).each do |to_new_id|
        course_users.build(user_id: to_new_id) unless to_new_id.blank?
      end
    else
      (attend_user_ids - values).each do |to_destroy_id|
        course_users.find_by(user_id: to_destroy_id).destroy
      end
      (values - attend_user_ids).each do |to_add_id|
        course_users.create(user_id: to_add_id) unless to_add_id.blank?
      end
    end
  end
end
