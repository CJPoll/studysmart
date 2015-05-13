class Offer < ActiveRecord::Base
  belongs_to :tutor, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tutored_course, class_name: 'Course', foreign_key: 'course_id'
end
