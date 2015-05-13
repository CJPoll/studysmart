class Course < ActiveRecord::Base
  belongs_to :university

  has_many :tutors, class_name: 'User', through: :offers, foreign_key: 'user_id'
  has_many :offers
end
