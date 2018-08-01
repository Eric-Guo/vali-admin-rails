require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'Course svsi_course valid' do
    svsi_course = courses(:svsi_course)
    assert svsi_course.valid?
    assert svsi_course.published
    assert svsi_course.users.count == 2
  end

  test 'Course audio_architecture_course valid' do
    audio_architecture_course = courses(:audio_architecture_course)
    assert audio_architecture_course.valid?
    assert_not audio_architecture_course.published
  end
end
