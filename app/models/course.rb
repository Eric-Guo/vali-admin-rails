class Course < ApplicationRecord
  validates_presence_of :title, :address, :capacity, :start_time, :end_time
  scope :not_published, -> { where(published: false) }
  scope :available, -> { where(published: true).where('start_time > ?', Time.zone.now) }
end
