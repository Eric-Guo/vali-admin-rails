class Course < ApplicationRecord
  validates_presence_of :title, :address, :capacity, :start_time, :end_time
end
